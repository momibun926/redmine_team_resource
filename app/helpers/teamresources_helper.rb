# Team resource helper.
#
module TeamresourcesHelper
  # Get user id from hash key
  def get_user_name(key)
    User.find_by(id: key.to_s.split("USER")[1].split("PROJECT")[0]) || "Not Assigned"
  end

  # Get project id from hash key
  def get_project_name(key)
    Project.find_by(id: key.to_s.split("USER")[1].split("PROJECT")[1])
  end
end
