module FacultiesHelper
  def faculty_btn_group
    links = []
    links << link_to("Add Faculty", new_faculty_path, :class => "btn btn-primary")
    links << link_to("Upload Faculties", faculty_upload_faculties_path)
    ApplicationHelper.btn_group(links)
  end
end
