# frozen_string_literal: true

class OauthClientsController < ApplicationController
  before_action :login_required
  before_action :get_client_application, only: %i[show edit update destroy]

  alias login_required authenticate_user!

  def index
    @client_application = current_user.client_applications.build(user_params)
    @tokens = current_user.tokens.find :all,
                                       conditions: 'oauth_tokens.invalidated_at is null and oauth_tokens.authorized_at is not null'
  end

  def new
    @client_application = ClientApplication.new
  end

  def create
    @client_application = current_user.client_applications.build(params[:client_application])
    if @client_application.save
      flash[:notice] = 'Registered the information successfully'
      redirect_to action: 'show', id: @client_application.id
    else
      render action: 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @client_application.update_attributes(params[:client_application])
      flash[:notice] = 'Updated the client information successfully'
      redirect_to action: 'show', id: @client_application.id
    else
      render action: 'edit'
    end
  end

  def destroy
    @client_application.destroy
    flash[:notice] = 'Destroyed the client application registration'
    redirect_to action: 'index'
  end

  private

  def user_params
    params.require(:client_application).permit(:name, :email, :url)
  end

  def get_client_application
    return if (@client_application = current_user.client_applications.find(params[:id]))

    flash.now[:error] = 'Wrong application id'
    raise ActiveRecord::RecordNotFound
  end
end
