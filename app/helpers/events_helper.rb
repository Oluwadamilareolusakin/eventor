# frozen_string_literal: true

module EventsHelper
  def event_time(event)
    event.time.strftime('%H:%M')
  end
end
