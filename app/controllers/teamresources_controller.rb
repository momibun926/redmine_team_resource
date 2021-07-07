# Team resource controller.
#
class TeamresourcesController < ApplicationController
  include SummarizeData
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
