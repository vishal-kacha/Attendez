class AddBranchToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :branch, null: false, foreign_key: true
  end
end
