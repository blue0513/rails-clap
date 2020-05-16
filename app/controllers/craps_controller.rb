class CrapsController < ApplicationController
  def new
  end

  def create
    Crap.create

    flash[:success] = 'You Crapped!!'
    redirect_to root_path
  end

  def view
  end

  def count_crap
    # TODO: viewed flag to be true
    @craps = Crap.all

    render partial: 'count_crap'
  end
end
