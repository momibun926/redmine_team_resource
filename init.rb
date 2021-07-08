require "redmine"

# Extention for ate class
class Date
  include Holidays::CoreExtensions::Date
end

# module define
Redmine::Plugin.register :redmine_team_resource do
  name "Redmine Team Resource Monitoring plugin"
  author "Hajime Nakagama"
  description "Shown summarize the monthly man-hours (estimated hours) of projects in which you are a member and which are ACTIVE projects."
  version "0.3.0"
  url "https://github.com/momibun926/redmine_team_resource"
  author_url "https://github.com/momibun926"
  # permission
  project_module :teamresourcemonitor do
    permission :view_teamresources, teamresources: :index
  end
  # menu
  menu :top_menu, :teamresourcemonitor, { controller: :teamresources, action: :index },
       caption: :caption_menu_team_resource_monitor
end
