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

  def reset
    Crap.all.each { |crap|
      crap.update(viewed: true)
    }

    flash[:success] = 'You reset counter!!'
    redirect_to view_path
  end

  def count_crap
    # TODO: viewed flag to be true
    @craps_count = Crap.all.reject { |crap| crap.viewed }.count

    render partial: 'count_crap'
  end
end
