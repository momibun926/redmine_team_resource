# Team resource controller.
#
class TeamresourcesController < ApplicationController
  include SummarizeData
  # View of main page.
  #
  def index
    @selectable_project_list = Project.all
    @selected_project_ids = params[:selected_project_ids] || {}
    summarize_by_date = create_summarize_by_date(@selected_project_ids)
    @summarize_by_month = create_summarize_by_month(summarize_by_date)
    @reange_month = create_range_month(@summarize_by_month)
  end
end
