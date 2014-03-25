class AddUserIdToFaculty < ActiveRecord::Migration
  def change
    add_column :faculties, :user_id, :integer
  end
end
