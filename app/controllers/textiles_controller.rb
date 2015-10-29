class TextilesController < ApplicationController

  def index
    @textiles = params[:code] || params[:name] ? Textile.where("code ILIKE ? AND name ILIKE ?", "#{params[:code]}%", "%#{params[:name]}%") : Textile.all
  end

end
