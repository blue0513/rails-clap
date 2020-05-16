class CrapsController < ApplicationController
  def new
  end

  def create
    Crap.create

    flash[:success] = 'You Crapped!!'
    redirect_to root_path
  end

  def view
    # TODO: viewed flag to be true
    @craps = Crap.all
  end
end
