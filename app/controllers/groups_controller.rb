class GroupsController < ApplicationController
   before_action :set_group, only: [:show]
   def index
      @groups = Group.all.order(created_at: :desc).includes(:accounts)
   end

   def new
      @group = Group.new
   end

   def create
      @group = Group.new(group_params)
      @group.user = current_user
      if @group.save
         flash[:notice] = 'Category created successfully'
         redirect_to groups_path
      else
         render :new, status: :unprocessable_entity
      end
   end

   def group_params
      params.require(:group).permit(:name, :icon)
   end

   def set_group
      @group = Group.find(params[:id])
   end
end
