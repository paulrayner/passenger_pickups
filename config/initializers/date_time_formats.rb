Time::DATE_FORMATS.merge!(
  :us => '%m/%d/%y',
  :us_with_time => '%m/%d/%y, %l:%M %p',
  :short_day => '%e %B %Y',
  :long_day => '%A, %e %B %Y',
  :pretty_time => lambda { |time| time.strftime("%l:%M") + time.strftime("%p").downcase },
  :pretty_date_with_time => lambda { |date| date.strftime("%m/%d/%y %l:%M") + date.strftime("%p").downcase }
)

Date::DATE_FORMATS[:human] = "%B %e, %Y"