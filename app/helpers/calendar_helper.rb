class Time
  def Time.validate(year, month=1, day=1,
      hour=0, min=0, sec=0, usec=0)
    require "date"

    begin
      d = Date.new(year,month,day)
    rescue
      return nil
    end
    Time.local(year,month,day,hour,min,sec,usec)
  end

  def to_date
    Date.new(year, month, day)
  rescue NameError
    nil
  end

  def to_datetime
    DateTime.new(year, month, day, hour, min, sec)
  rescue NameError
    nil
  end
end

class Date
  def to_time
    Time.local(year,month,day)
  end
end

require 'date'

module CalendarHelper
  def month_days(month,year=Date.today.year)
    mdays = [nil,31,28,31,30,31,30,31,31,30,31,30,31]
    mdays[2] = 29 if Date.leap?(year)
    mdays[month]
  end
  #на вход функции подается год и месяц, на выходе матрица(6х7), заполенная датами этого месяца
  def month_and_year_to_matrix(month, year)
    days = month_days(month,year)
    (month == 1) ? prev_days = month_days(12, year - 1) : prev_days = month_days(month - 1, year)
  #(month = 12) ? next_days = month_days(1, year + 1) : next_days = month_days(month + 1, year)

    t = Time.mktime(year,month,1)
    first = t.wday-1
    last_day_in_m = Time.mktime(year,month,days).wday-1
    start_day = prev_days - first
    end_day = 7 - last_day_in_m
    list = *1..days
    weeks = [[]]
    week1 = 7 - first
    first.times do |i|
      weeks[0] << start_day+i+1
    end
    week1.times { weeks[0] << list.shift }
    nweeks = list.size/7 + 1
    nweeks.times do |i|
      weeks[i+1] ||= []
      7.times do |j|
        weeks[i+1] << j if list.empty?
  #break if list.empty?
        weeks[i+1] << list.shift
      end
    end
    pad_first = 7-weeks[0].size
    pad_first.times { weeks[0].unshift(nil) }
    pad_last = 7-weeks[0].size
    pad_last.times { weeks[-1].unshift(nil) }
    weeks
  end
  def get_month_calendar(month,year)
    html = "<table id = \"month_table\">
            <tr id = \"month_header\"><td>пн</td><td>вт</td><td>ср</td><td>чт</td><td>пт</td><td>сб</td><td>вс</td></tr>\n"
    weeks = month_and_year_to_matrix(month,year)
    is_cur_month = false
    weeks.each do |wk|
      html += "<tr>"
      wk.each do |d|
        if not is_cur_month and d == 1
          is_cur_month = true
        elsif is_cur_month and d == 1
          is_cur_month = false
        end
        item = d.nil? ? "" : "%2d" % d
        if is_cur_month
          html += "<td class = \"cur_month_day\">"
        else
          html += "<td class = \"no_cur_month_day\">"
        end
        html += item + "</td>"
      end
      html += "</tr>\n"
    end
    html += "</table>\n"
  end
end
#print_calendar(12, 2018)