class RollsController < ApplicationController

  def index
    @rolls = Roll.all
  end

  def show
    @roll = Roll.find(params[:id])

    render @roll
  end

  def create
    @roll = Roll.create(roll_params)
    @arrival = Arrival.new(arrival_params)
    @arrival.roll = @roll
    @arrival.save

    render @roll
  end

  def destroy
    @roll = Roll.find(params[:id])
    @roll.destroy

    render @roll
  end

private

  def roll_params
    params.require(:roll).permit(:textile_id, :suffix, :location, :comment)
  end

  def arrival_params
    params.require(:arrival).permit(:total, :arrival_date, :info)
  end

end
