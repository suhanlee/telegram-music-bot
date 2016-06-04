class CreateFowards < ActiveRecord::Migration
  def change
    create_table :fowards do |t|
      t.string :chat_id
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
