# Team resource helper.
#
module TeamresourcesHelper
  # Get user name from hash key
  #
  # @param [Symbol] key concatinate user id and project id. ex: USER1PROJECT10
  # @return [String] user name.
  def get_user_name(key)
    User.find_by(id: key.to_s.split("USER")[1].split("PROJECT")[0]) || l(:no_assigned)
  end

  # Get project name from hash key
  #
  # @param [Symbol] key concatinate user id and project id. ex: USER1PROJECT10
  # @return [String] project name.
  def get_project_name(key)
    Project.find_by(id: key.to_s.split("USER")[1].split("PROJECT")[1])
  end
end
