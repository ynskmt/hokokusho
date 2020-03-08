class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :year,         null: false
      t.integer :month,        null: false
      t.integer :day,          null: false
      t.string :unit, null: false
      t.integer :homework_rate, null: false
      t.string :homework, null: false
      t.text :content, null: false
      t.string :teacher, null: false
      t.references :student, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
