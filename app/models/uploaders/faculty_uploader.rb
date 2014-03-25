class FacultyUploader
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Uploader

  def persisted?
    false
  end

  def initialize(params = {})
    super(params[:file])
  end

  def columns
    @columns = @columns ||  Faculty.columns_defined
  end

  def save
    super do |row|
      faculty = Faculty.find_by_id(row["id"]) || Faculty.new
      faculty.attributes = row.to_hash.slice(*columns)
      user = faculty.build_user
      user.attributes = {:email => row["email"], :user_id => row["email"], :password => "welcome", :password_confirmation => "welcome", :role => "faculty" }
      faculty
    end
  end

  def xls_template(options)
    CSV.generate(options) do |csv|
      csv << (columns << "email") #for nested user details
    end
  end

end
