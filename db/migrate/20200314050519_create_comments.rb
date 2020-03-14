class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text        :text,          null: false
      
      t.integer :user_id
      t.integer :student_id
      t.integer :report_id
      t.timestamps
    end
  end
end
