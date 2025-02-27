module ApplicationHelper
  def in_local_time(dt)
    dt.in_time_zone
  end
end
