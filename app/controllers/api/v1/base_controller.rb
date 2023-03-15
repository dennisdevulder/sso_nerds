# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      oauthenticate interactive: false
      respond_to :json, :xml
    end
  end
end
