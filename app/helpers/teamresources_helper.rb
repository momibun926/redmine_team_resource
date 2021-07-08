# Team resource helper.
#
module TeamresourcesHelper
  # Get user id from hash key
  #
  # @param [Symbol] key concatinate user id and project id. ex: USER1PROJECT10
  # @return [String] user id
  def user_id_from_key(key)
    key.to_s.split("USER")[1].split("PROJECT")[0]
  end

  # Get project id from hash key
  #
  # @param [Symbol] key concatinate user id and project id. ex: USER1PROJECT10
  # @return [String] project id
  def project_id_from_key(key)
    key.to_s.split("USER")[1].split("PROJECT")[1]
  end

  # Get user name from hash key
  #
  # @param [Symbol] key concatinate user id and project id. ex: USER1PROJECT10
  # @return [String] user name.
  def get_user_name(key)
    User.find_by(id: user_id_from_key(key)) || l(:no_assigned)
  end

  # Get project name from hash key
  #
  # @param [Symbol] key concatinate user id and project id. ex: USER1PROJECT10
  # @return [String] project name and link.
  def link_to_member_project(key)
    proj = Project.find_by(id: project_id_from_key(key))
    link_to(proj.name, "#{project_path(proj)}/issues")
  end

  # Label total
  #
  # @param [String] hours_of_day hours of day
  # @return [String] caption of total
  def label_total_time(hours_of_day)
    if hours_of_day.to_s == "1.0"
      l(:label_total_hours)
    else
      l(:label_total_days)
    end
  end

  # put value row user of project
  #
  # @param [Symbol] key
  # @param [Array] range_month
  # @param [Hash] summarize_by_month
  # @param [String] hours_of_day inputted option field
  # @return [String] sumarized by month row html
  def value_row(key, range_month, summarize_by_month, hours_of_day)
    ret = tag.td(link_to_member_project(key))
    range_month.each do |year_month|
      ret += tag.td((summarize_by_month[key][year_month] / hours_of_day.to_f).round(1), id: "sumrized_value")
    end
    tag.tr(ret)
  end

  # put total of user row
  #
  # @param [Symbol] key
  # @param [Array] range_month
  # @param [Hash] summarize_user_total_by_month
  # @param [String] hours_of_day
  # @return [String] user total row html
  def total_row(key, range_month, summarize_user_total_by_month, hours_of_day)
    ret = tag.td(label_total_time(hours_of_day))
    range_month.each do |year_month|
      ret += tag.td((summarize_user_total_by_month[key.to_s.split("PROJECT")[0]][year_month] / hours_of_day.to_f).round(1), id: "total_value")
    end
    tag.tr(ret, id: "total_row")
  end

  # put header row
  #
  # @param [Array] range_month start month to end manth
  # @return [String] header row html tag
  def header_row(range_month)
    ret = tag.th(l(:label_project), id: "hdear_project")
    range_month.each do |year_month|
      ret += tag.th(year_month, id: "header_month")
    end
    tag.tr(ret)
  end

  # put user and table
  #
  # @param [String] key hash key. ex USERxxxPROJECTxxx
  # @return [String] user name and tabale tag
  def user_and_table_start(key)
    tag.h2(get_user_name(key)) + tag(:table, id: "sumrized_table", border: "1", bordercolor: "#bbb", open: true)
  end
end
