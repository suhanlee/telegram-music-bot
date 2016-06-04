require 'telegram/bot'

Dotenv.load

def logging_message(message)
  begin
    Chat.create(:chat_id => message.chat.id,
                :from_id => message.from.id,
                :first_name => message.from.first_name,
                :last_name => message.from.last_name,
                :text => message.text)
  rescue Exception => e
    puts e
  end
end

def send_message_to_owner(bot, message)
  begin
    Foward.all.each do |foward|
      bot.api.send_message(chat_id: foward.chat_id, text: "#{message.from.first_name}, #{message.from.last_name} : " + message.text)
    end
  rescue Exception => e
    puts e
  end
end

def handle_command_message(bot, message)
  case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/subscribe'
      bot.api.send_message(chat_id: message.chat.id, text: "이제부터 저에게 오는 모든 메시지는 당신에게 전송됩니다.  #{message.from.first_name} ")
      puts "구독 #{message.from.first_name} : #{message.from.id}"
      Foward.create(:chat_id => message.from.id, :first_name => message.from.first_name, :last_name => message.from.last_name)
    when '/unsubscribe'
      bot.api.send_message(chat_id: message.chat.id, text: "이제부터 저에게 오는 모든 메시지는 당신에게 전송하지 않습니다.  #{message.from.first_name} ")
      puts "해제 #{message.from.first_name} : #{message.from.id}"
      foward = Foward.find_by_chat_id(message.from.id)
      foward.destroy
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
  end
end

pid = Thread.new do
  puts 'load it ' + ENV['TOKEN']
  Telegram::Bot::Client.run(ENV['TOKEN']) do |bot|
    bot.listen do |message|
      begin
        puts message.chat.id
        puts "#{message.from.first_name} : #{message.chat.id} / #{message.text}"

        puts message.chat.id
        handle_command_message(bot, message)
        logging_message(message)
        send_message_to_owner(bot, message)
      rescue Exception => e
        puts e
      end
    end
  end
end