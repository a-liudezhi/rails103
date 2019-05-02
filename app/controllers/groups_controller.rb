class GroupsController < ApplicationController
 before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
 before_action :find_group_and_check_permisson, only: [:edit, :update, :destroy]
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts.recent.paginate(:page => params[:page], :per_page => 5) 
  end

  def edit
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
   if @group.save
    redirect_to groups_path
  else
    render :new
  end
end

  def update

  if @group.update(group_params)
    redirect_to groups_path, notice: "update Success"
  else
    render :edit
  end
  end

  def destroy

    @group.destroy
    flash[:alert] = "Group deleted"
    redirect_to groups_path
  end

private

  def find_group_and_check_permisson
    @group = Group.find(params[:id])
    if current_user != @group.user
      redirect_to root_path, alert: "You have no perminsson"
  end
end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
