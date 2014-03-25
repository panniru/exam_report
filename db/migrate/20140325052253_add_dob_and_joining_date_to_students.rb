class AddDobAndJoiningDateToStudents < ActiveRecord::Migration
  def change
    add_column :students, :dob, :date
    add_column :students, :joining_date, :date
  end
end
