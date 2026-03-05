class CreateWeeks < ActiveRecord::Migration[8.1]
  def change
    create_table :weeks do |t|
      t.integer :week_number
      t.text :week_program, array: true
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
