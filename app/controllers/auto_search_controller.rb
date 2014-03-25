class AutoSearchController < ApplicationController
  skip_authorization_check

  autocomplete :student, :roll_number, :full => true, :extra_data => [:name]
    autocomplete :faculty, :name, :full => true

  def autocomplete_student_by_roll_no_and_name
    term = params[:term]
    students = Student.where("lower(roll_number) ILIKE '%#{term}%' OR lower(name) ILIKE '%#{term}%'").order(:name)
    render :json => students.map { |student| {:id => student.id, :label => student.name, :value => student.name} }
  end

end
