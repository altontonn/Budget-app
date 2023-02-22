class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:user).where(user_id: current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to group_path(@group), notice: 'Category created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
