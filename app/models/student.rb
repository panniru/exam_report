class Student < ActiveRecord::Base
  
  include PgSearch
  multisearchable :against => [:name, :roll_number]

  validates :roll_number, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validates :father_name, :presence => true
  validates :mother_name, :presence => true

  scope :search, lambda { |id| where(:id => id)}

  def self.columns_defined
    Student.column_names.reject {|x| ["id", "created_at", "updated_at"].include?x}
  end

end
