class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  protect_from_forgery with: :exception
  
  def after_sign_up_path_for(resource_or_scope)
    if resource_or_scope =- current_user
       stored_location_for(resource_or_scope) || posts_path
    elsif resource_or_scope == current_company
       stored_location_for(resource_or_scope) || company_path(current_company.id)
    end
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == current_user
      stored_location_for(resource_or_scope) || posts_path
    elsif resource_or_scope == current_company
      stored_location_for(resource_or_scope) || company_path(current_company.id)
    end
  end
  
  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :name, :company_name])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email, :name, :company_name])
    end
    
end
