module EventsHelper
  def event_time(event)
    event.event_time.strftime('%H:%M')
  end

  def attendees(attendees)
    if attendees.any?
      attendees.each do |attendee|
        attendee
      end
    end
  end
end
