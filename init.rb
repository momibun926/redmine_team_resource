require "redmine"

# module define
Redmine::Plugin.register :redmine_team_resource do
  name "Redmine Team Resource Monitoring plugin"
  author "Hajime Nakagama"
  description "Aggregate the estimated time for the project you are assigned to."
  version "0.4.2"
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
