# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :error_handler

  private

  def error_handler(exception)
    redirect_back fallback_location: :root, alert: exception.message
  end
end
