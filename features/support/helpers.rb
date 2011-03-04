def relative_date(date_name)
  case date_name
    when "today"
      return Date.today
    when "yesterday"
      return Date.today - 1.day
    when "tomorrow"
      return Date.today + 1.day
    else
      return nil
  end
end