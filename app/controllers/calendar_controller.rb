class CalendarController < ApplicationController
  def show
    @month_calendar = 'month'
    @day_calendar = 'day'
    @year_calendar = 'year'
  end
end
