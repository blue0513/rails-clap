class ClapsController < ApplicationController
  before_action :logged_in?, only: [:view, :reset]

  def new
  end

  def create
    Clap.create

    flash[:success] = 'You Clapped!!'
    redirect_to root_path
  end

  def view
  end

  def reset
    Clap.all.each { |clap|
      clap.update(viewed: true)
    }

    flash[:success] = 'You reset counter!!'
    redirect_to view_path
  end

  def count_clap
    # TODO: viewed flag to be true
    @claps_count = Clap.all.reject { |clap| clap.viewed }.count

    render partial: 'count_clap'
  end

  private

  def logged_in?
    redirect_to admin_login_path if cookies[:_clap_rails_admin].nil?
  end
end
