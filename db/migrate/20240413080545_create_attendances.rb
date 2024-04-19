class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.boolean :status
      t.string "subject_name", null:false
      t.string 'created_date', null: false
      t.string 'updated_date', null: false
      t.string 'created_time', null: false
      t.string 'updated_time', null: false

      t.timestamps
    end
  end
end
