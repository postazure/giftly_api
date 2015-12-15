class GroupsController < ApplicationController
  def create
    group = Group.new(group_params)
    group.owner_id = current_user.id
    group.users << current_user
    if group.save
      render json: group, status: 201
    end
  end

  def index
    groups = current_user.groups
    puts groups.as_json
    render json: groups, status: 200
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end