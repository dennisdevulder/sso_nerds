# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :client_applications
  has_many :tokens, -> { includes(:client_application) }, class_name: 'Oauth2Token'
end
