class CreateChats < ActiveRecord::Migration[8.1]
  def change
    create_table :chats do |t|
      t.text :ai_answer
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
