class RollsController < ApplicationController

  def index
    @rolls = Roll.includes(:textile, :arrival, :store_receipts).all
  end

  def show
    @roll = Roll.find(params[:id])
  end

  def create
    @roll = Roll.create(roll_params)
  end

  def destroy
    @roll = Roll.find(params[:id]).destroy

    render nothing: true
  end

private

  def roll_params
    params.require(:roll).permit(:textile_id, :suffix, :location, :comment, arrival_attributes: [:total, :arrival_date, :info])
  end

end
