# Summarize data
#
module SummarizeData
  include ResourceDataFetcher
  # Create data of summarize by date
  #
  # @param [Array] project_ids specify ids of project
  # @return [Hash] summarized date
  def create_summarize_by_date(project_ids)
    summarize_by_date = {}
    issues = specify_project_issue(project_ids)
    issues.each do |issue|
      issue.due_date ||= Version.find(issue.fixed_version_id).effective_date
      issue.assigned_to_id ||= 0
      assigned_days = working_days(issue.start_date, issue.due_date)
      hours_per_day = issue_hours_per_day(issue.estimated_hours.to_f, assigned_days.length)
      hash_key = "USER#{issue.assigned_to_id}PROJECT#{issue.project_id}".to_sym
      temp = summarize_by_date[hash_key]
      temp ||= {}
      assigned_days.each do |date|
        temp[date] = add_daily_hour(temp[date], hours_per_day)
      end
      summarize_by_date[hash_key] = temp
    end
    summarize_by_date
  end

  # Create data of summarize by month
  #
  # @param [Hash] summarize_by_date summarize of date
  # @return [Hash] summarized date
  def create_summarize_by_month(summarize_by_date)
    temp_days = {}
    summarize_by_month = {}
    summarize_by_date.each_key do |k|
      temp_days = summarize_by_date[k]
      temp_month = {}
      temp_days.each do |k, v|
        if temp_month[k.strftime("%Y-%m")].nil?
          temp_month[k.strftime("%Y-%m")] = temp_days[k]
        else
          temp_month[k.strftime("%Y-%m")] += temp_days[k]
        end
      end
      summarize_by_month[k] = temp_month
    end
    summarize_by_month
  end

  # create range of month
  #
  # @param [Hash] summarize_by_month summarize of month
  # @return [Array] month of existing data
  def create_range_month(summarize_by_month)
    month_array = []
    summarize_by_month.each_key do |k|
      month_array << summarize_by_month[k].keys.uniq
    end
    month_array.flatten.uniq.sort
  end

  # Estimated time per day.
  #
  # @param [Numeric] estimated_hours estimated hours
  # @param [Numeric] days working days
  # @return [Numeric] estimate hours per days
  def issue_hours_per_day(estimated_hours, days)
    (estimated_hours || 0.0) / days
  end

  # working days.
  # exclude weekends and holiday or include weekends and holiday.
  #
  # @param [Date] start_date start date of issue
  # @param [Date] end_date end date of issue
  # @return [Array] working days
  def working_days(start_date, end_date)
    issue_days = (start_date..end_date).to_a
    working_days = issue_days.reject { |e| e.wday.zero? || e.wday == 6 }
    working_days.length.zero? ? issue_days : working_days
  end

  # Add daily hour
  #
  # @param [Numeric] evm_value EVM value
  # @param [Numeric] value EVM value
  # @param [Numeric] done_ratio done ratio
  # @return [Numeric] after add value
  def add_daily_hour(evm_value, value, done_ratio = 100)
    add_value = value.to_f * done_ratio.fdiv(100)
    evm_value.nil? ? add_value : evm_value.to_f + add_value
  end
end
