class CreateLessions < ActiveRecord::Migration[5.0]
  def change
    create_table :lessions do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :teacher_id
      t.date :start_at
      t.integer :status
      t.string :url

      t.timestamps
    end
    add_index :lessions, :course_id
    add_index :lessions, :student_id
    add_index :lessions, :teacher_id
    add_index :lessions, :start_at
  end
end
