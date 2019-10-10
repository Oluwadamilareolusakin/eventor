# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @planner = FactoryBot.create(:user)
    @event = FactoryBot.create(:event, planner: @planner)
  end

  context 'with valid event details' do
    it 'creates a valid event' do
      expect(@event).to be_valid
    end

    it 'has a title' do
      expect(@event.title).to eq('Example event')
    end

    it 'has a description' do
      expect(@event.description).to eq('This is a valid event description')
    end
  end

  context 'with invalid event details' do
    it 'is not valid' do
      @event.event_time = nil
      expect(@event).to_not be_valid
    end
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:event_time) }
  it { is_expected.to validate_presence_of(:event_date) }
end
