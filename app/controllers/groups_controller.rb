class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def create
    @group = Group.create(group_params)
  end

private

  def group_params
    params.require(:group).permit(:name)
  end


end
