# Team resource controller.
#
class TeamresourcesController < ApplicationController
  include SummarizeData
  # View of main page.
  #
  def index
    # project of member and active
    @selectable_project_list = Project.allowed_to(User.current, :view_project, {member: true}).active
    # selected project ids
    @selected_project_ids = params[:selected_project_ids] || @selectable_project_list
    # summarize data
    summarize_by_date = create_summarize_by_date(@selected_project_ids)
    @summarize_by_month = create_summarize_by_month(summarize_by_date)
    @summarize_user_total_by_month = create_summarize_user_total_by_month(@summarize_by_month)
    @reange_month = create_range_month(@summarize_by_month)
    # hours of day
    @hours_of_day = params[:hours_of_day] || 1.0
  end
end
