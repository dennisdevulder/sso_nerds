# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      respond_to :json, :xml
      oauthenticate interactive: false
    end
  end
end
