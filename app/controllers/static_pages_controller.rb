# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def landing_page
    redirect_to current_user if logged_in?
  end
end
