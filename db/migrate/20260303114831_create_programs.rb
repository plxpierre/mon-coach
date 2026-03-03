class CreatePrograms < ActiveRecord::Migration[8.1]
  def change
    create_table :programs do |t|
      t.string :title
      t.integer :number_of_week
      t.string :level
      t.text :goal
      t.text :tools
      t.text :medical_conditions
      t.string :sport
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
