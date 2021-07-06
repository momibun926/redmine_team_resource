# Team resource helper.
module TeamresourcesHelper
  def summary_title(before_key, current_key)
    if before_key == current_key
      current_key.to_s.split("USER")[1].split("PROJECT")[1]
    else
      current_key.to_s.split("USER")[1].split("PROJECT")[0]
    end
  end
end
