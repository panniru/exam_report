class RenameJoiningDataToJoiningDateInFaculties < ActiveRecord::Migration
  def change
    rename_column :faculties, :joining_data, :joining_date
  end
end
