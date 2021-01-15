class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :plan
      t.integer :course_id

      t.timestamps
    end
  end
end
