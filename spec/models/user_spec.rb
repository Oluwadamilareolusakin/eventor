# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
  end

  context 'with valid details' do
    it 'should create a user' do
      expect(@user).to be_valid
    end
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:username) }
end
