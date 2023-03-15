# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user=(user)
    current_user = user
  end
end
