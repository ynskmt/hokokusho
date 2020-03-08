class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :school_id, null: false
      t.string :subject_id, null: false
      t.string :grade_id, null: false
      t.timestamps
    end
  end
end
