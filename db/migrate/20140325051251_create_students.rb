class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :roll_number
      t.string :father_name
      t.string :mother_name
      t.string :parent_email
      t.string :mobile_number

      t.timestamps
    end
  end
end
