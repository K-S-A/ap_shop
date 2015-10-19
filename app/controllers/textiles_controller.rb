class TextilesController < ApplicationController

  def index
    @textiles = params[:code] ? Textile.where("code ILIKE ?", "#{params[:code]}%") : Textile.all
  end

end
