class Faculty < ActiveRecord::Base
  include PgSearch
  before_destroy :destroy_user

  multisearchable :against => [:name]

  validates :name, :presence => true

  belongs_to :user
  accepts_nested_attributes_for :user

  scope :search, lambda { |id| where(:id => id)}

  def self.columns_defined
    columns = Faculty.column_names.reject {|x| ["id", "created_at", "updated_at", "user_id"].include?x}
  end

  private
  
  def destroy_user
    self.user.destroy
  end

end
