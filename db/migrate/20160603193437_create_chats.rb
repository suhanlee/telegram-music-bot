class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :chat_id
      t.string :from_id
      t.string :first_name
      t.string :last_name
      t.text :text

      t.timestamps null: false
    end
  end
end
