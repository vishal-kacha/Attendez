class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
