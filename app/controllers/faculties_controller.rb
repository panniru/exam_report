class FacultiesController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new]
  authorize_resource

  def index
    page = params[:page].present? ? params[:page] : 1
    if params[:search].present?
      @faculties = Faculty.search(params[:search]).paginate(:page => 1)
    else
      @faculties = Faculty.all.order("name").paginate(:page => page)
    end
  end

  def new
    @faculty.build_user
    @faculty.user.role = "faculty"
  end

  def show
    @faculty = FacultiesDecorator.decorate(@faculty)
  end

  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash.now[:success] = I18n.t :success, :scope => [:faculty, :create]
      render "show"
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:faculty, :create]
      render "new"
    end
  end

  def update
    if @faculty.update(faculty_update_params)
      @faculty.reload
      flash.now[:success] = I18n.t :success, :scope => [:faculty, :update]
      render "show"
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:faculty, :update]
      render "edit"
    end
  end

  def destroy
    if @faculty.destroy
      flash.now[:success] = I18n.t :success, :scope => [:faculty, :destroy]
      redirect_to faculties_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:faculty, :destroy]
      render "show"
    end
  end

  def faculty_upload
    @faculty_uploader = FacultyUploader.new
    respond_to do |format|
      format.html { render "new_upload"}
      format.xlsx { send_data @faculty_uploader.xls_template(col_sep: "\t") }
    end
  end

  def upload
    @faculty_uploader = FacultyUploader.new(params[:faculty_uploader])
    if @faculty_uploader.save
      flash[:success] = I18n.t :success, :scope => [:faculty, :upload]
      redirect_to faculties_path
    else
      render "new_upload"
    end
  end


  private

  def faculty_params
    fac_params = params.require(:faculty).permit(:name , :joining_date, :mobile_number, :user_attributes => [:user_id, :email, :password, :password_confirmation, :role])
  end

  def faculty_update_params
    fac_params = params.require(:faculty).permit(:name , :designation, :mobile_number)
  end

end
