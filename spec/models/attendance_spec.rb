# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event, planner: @user)
    @attendance = Attendance.new(attendee: @user, event: @event)
  end

  context 'valid attendance' do
    it 'should create a valid attendance' do
      expect(@attendance).to be_valid
    end

    it 'should belong to an attendee' do
      expect(@attendance.attendee.name).to eq(@user.name)
    end

    it 'should belong to an event' do
      expect(@attendance.event.title).to eq(@event.title)
    end
  end
end
