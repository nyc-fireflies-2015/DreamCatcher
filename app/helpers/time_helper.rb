module TimeHelper
  def elapsed_time(time)
    seconds = (Time.now - time).to_i
    minutes = seconds/60
    hours = minutes/60
    days = hours/24

    if minutes == 0
      return "#{seconds} seconds"
    elsif hours == 0
      return "#{minutes} minutes"
    elsif days == 0
      return "#{hours} hours"
    else
      return "#{days} days"
    end
  end

  def display_date(time)
    time.strftime("%B %d %Y")
  end
end
