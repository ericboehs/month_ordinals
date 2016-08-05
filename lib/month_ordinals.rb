require "month_ordinals/version"
require "month_ordinals/ext/hash"

class MonthOrdinals
  ORDINALS = %i(first second third fourth fifth last)
  WEEKDAYS = %i(sunday monday tuesday wednesday thursday friday saturday)

  def self.for years
    years = years..years unless years.is_a? Range
    ORDINALS.map { |ordinal| { ordinal => years_map(years, ORDINALS.index(ordinal)) } }.reduce Hash.new, :merge
  end

  private

  def self.years_map years, ordinal
    years.map { |year| weekdays_map year, ordinal }.reduce Hash.new, :deep_array_merge
  end

  def self.weekdays_map year, ordinal
    WEEKDAYS.map { |weekday| [weekday, months_map(year, ordinal, WEEKDAYS.index(weekday))] }.to_h
  end

  def self.months_map year, ordinal, day_of_week, months=1..12
    months.map do |month|
      date =
        if ordinal == 5
          last_day_of_month day_of_week, year, month
        else
          ordinal_day_of_month ordinal, day_of_week, year, month
        end
      date if date.month == month
    end.compact
  end

  def self.last_day_of_month day_of_week, year, month
    date = Date.new year, month, -1
    offset = date.wday - day_of_week
    date -= offset % 7
  end

  def self.ordinal_day_of_month ordinal, day_of_week, year, month
    date = Date.new year, month, 1
    offset = day_of_week - date.wday
    date += offset % 7
    date += 7 * ordinal
  end
end
