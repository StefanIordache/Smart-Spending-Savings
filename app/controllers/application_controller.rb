class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # protect_from_forgery

  prepend_before_action :set_locale

  before_action :set_locale

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def after_sign_in_path_for(resource)
    "/dashboard/index"
  end

end
