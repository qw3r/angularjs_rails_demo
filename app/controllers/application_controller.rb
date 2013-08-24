class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :intercept_html_requests
  after_filter :set_xsrf_cookie

  layout nil

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X_XSRF_TOKEN']
  end

  private

  def intercept_html_requests
    render('layouts/dynamic') if request.format == Mime::HTML
  end

  def set_xsrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def handle_unverified_request
    reset_session
    render "#{Rails.root}/public/500.html", :status => 500, :layout => nil
  end

end
