class AdminController < ApplicationController
  def show_login_form
  end

  def login
    unless match?
      flash[:danger] = 'ID or Password invalid'
      return redirect_to admin_login_path
    end

    cookies[:_crap_rails_admin] = {
      value: 'crap_rails',
      secure: Rails.env.production?,
      httponly: true
    }

    flash[:success] = 'Admin Login'
    redirect_to view_path
  end

  private

  def match?
    params[:id] == ENV['ADMIN_ID'] &&
      params[:password] == ENV['ADMIN_PASSWORD']
  end
end
