class CrapsController < ApplicationController
  def new
  end

  def create
    # Create.new.create
    redirect_to root_path
  end

  def view
    # @craps = Craps.all
    @craps = 100
  end
end
