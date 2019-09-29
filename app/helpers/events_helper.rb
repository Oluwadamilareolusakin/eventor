module EventsHelper
  def event_time(event)
    event.event_time.strftime('%H:%M')
  end
end
