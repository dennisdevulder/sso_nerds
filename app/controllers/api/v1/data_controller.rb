# frozen_string_literal: true

module Api
  module V1
    class DataController < ApplicationController
      def show
        respond_with ({:super_secret => "oauth_data"})
      end
    end
  end
end
