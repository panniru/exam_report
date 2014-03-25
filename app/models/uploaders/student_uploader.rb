class StudentUploader
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
    @columns = @columns ||  Student.columns_defined
  end

  def save
    super do |row|
      student = Student.find_by_id(row["id"]) || Student.new
      student.attributes = row.to_hash.slice(*columns)
      student
    end
  end

  def xls_template(options)
    template_headers = Student.columns_defined
    CSV.generate(options) do |csv|
      csv << template_headers
    end
  end

end
