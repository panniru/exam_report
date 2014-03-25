class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.date :joining_data
      t.string :email
      t.string :mobile_number

      t.timestamps
    end
  end
end
