class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  protected

  # Permit the new params here.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :avatar])
  end
end