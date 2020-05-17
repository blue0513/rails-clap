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
      clap.update(hidden: true)
    }

    flash[:success] = 'You reset counter!!'
    redirect_to view_path
  end

  def count_clap
    all_active_claps = Clap.all.reject { |clap| clap.hidden }

    @new_claps_count = all_active_claps.reject { |clap| clap.viewed }.count
    @active_claps_count = all_active_claps.count

    view!(all_active_claps)
    render partial: 'count_clap'
  end

  private

  def logged_in?
    redirect_to admin_login_path if cookies[:_clap_rails_admin].nil?
  end

  def view!(claps)
    claps.each { |clap| clap.update(viewed: true) }
  end
end
