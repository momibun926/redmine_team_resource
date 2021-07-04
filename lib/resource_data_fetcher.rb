# Resource data fetcher
#
module ResourceDataFetcher
  # Common condition of issue's select
  SQL_COM = <<-SQL_COM.freeze
  (issues.start_date IS NOT NULL AND issues.due_date IS NOT NULL)
  OR
  (issues.start_date IS NOT NULL
   AND
   issues.due_date IS NULL
   AND
   issues.fixed_version_id IN (SELECT id FROM versions WHERE effective_date IS NOT NULL))
  SQL_COM

  # Get issues of specify project.
  #
  # @param [array] project_ids project ids
  # @return [Issue] issue object
  def specify_project_issue(project_ids)
    Issue.where(SQL_COM.to_s).
      where(project_id: project_ids)
  end
end
