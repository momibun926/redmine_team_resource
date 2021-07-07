# Team resource helper.
module TeamresourcesHelper
  # Get user id from hash key
  def get_user_id(key)
    key.to_s.split("USER")[1].split("PROJECT")[0]
  end

  # Get project id from hash key
  def get_project_id(key)
    key.to_s.split("USER")[1].split("PROJECT")[1]
  end
end
