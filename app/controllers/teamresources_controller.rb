# Team resource controller.
#
class TeamresourcesController < ApplicationController
  include SummarizeData
  # View of main page.
  #
  def index
    # project of member and active
    @selectable_project_list = Project.allowed_to(User.current,
                                                  :view_project,
                                                  { member: true }).active
    # selected project ids
    selected_project_ids = params[:selected_project_ids] || @selectable_project_list
    # summarize data
    summarize_by_date = create_summarize_by_date(selected_project_ids, params[:only_me])
    @summarize_by_month = create_summarize_by_month(summarize_by_date)
    @summarize_user_total_by_month = create_summarize_user_total_by_month(@summarize_by_month)
    @range_month = create_range_month(@summarize_by_month)
    # hours of day
    @hours_of_day = default_hours_of_day
  end

  private

  # Default hours of day
  # No set hours of day is "1.0"
  #
  def default_hours_of_day
    hours = case params[:hours_of_day].to_f
            when 1.0..24.0
              params[:hours_of_day]
            else
              1.0
            end
    format("%.1f", hours)
  end
end
