class CalendarController < ApplicationController
  helper CalendarHelper
  def show
    #@month_calendar = get_month_calendar(12, 2018)
    @day_calendar = 'day'
    @year_calendar = 'year'
  end
end
