class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :timeoutable,
  :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:user_id]
  include PgSearch

  validates :user_id, :presence => true, :uniqueness => true
  validates :role, :presence => true
  attr_accessor :time_zone

  multisearchable :against => [:user_id, :email]

  def self.search(id)
    self.where(:id => id)
  end

  def admin?
    self.role == 'admin'
  end

  def faculty?
    self.role == 'faculty'
  end

end
