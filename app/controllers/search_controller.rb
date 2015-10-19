class SearchController < ApplicationController

  def find_item
    @rolls = []
    if params[:code]
      Textile.where("code LIKE ?", "#{params[:code]}%").find_each do |textile|
        textile.rolls.each{ |roll| @rolls.push(roll) }
      end
      render 'rolls/index'
    end
  end

  def find_group
    if params[:name]
      @groups = Group.where("name ILIKE ?", "%#{params[:name]}%")
      render 'groups/index'
    end
  end

  def find_gr
    if params[:index]
      @groups = Group.where("name ILIKE ?", "%#{params[:index]}%")
      render 'groups/index'
    end
  end

end
