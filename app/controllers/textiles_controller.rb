class TextilesController < ApplicationController

  def index
    @textiles = Textile.includes(rolls: [:arrival, :store_receipts]).where("code ILIKE ? AND name ILIKE ?", "#{params[:code]}%", "%#{params[:name]}%")
  end

end
