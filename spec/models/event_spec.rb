require 'rails_helper'

RSpec.describe Event, :type => :model do

  it 'has a valid factory' do
    expect(event).to be_valid
  end

  it 'has none to begin with' do
    expect(Event.count).to eq(0)
  end

  it 'has one after creating one' do
    user.events.build
    expect(Event.count).to eq(1)
  end

  it 'has none after one was created in the last test' do
    expect(Event.count).to eq(0)
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:event_time) }
  it { is_expected.to validate_presence_of(:event_date) }
end                                                                                                                                                                                                                                                                                                                       