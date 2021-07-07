# Team resource controller.
# This controller provide main monitor view.
#
# 1. before action
#
class TeamresourcesController < ApplicationController
  include SummarizeData
  # menu
  # menu_item :teamresourcemonitor
  # Before action
  # before_action :authorize

  # View of main page.
  #
  def index
    # test code
    project_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    summarize_by_date = create_summarize_by_date(project_ids)
    @summarize_by_month = create_summarize_by_month(summarize_by_date)
    @reange_month = create_range_month(@summarize_by_month)
  end
end
