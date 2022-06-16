class GroupsController < ApplicationController
  def new
    @group = Group.new
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    authorize @group
    if @group.save
      flash[:info] = "Sucessfully created group: <strong>#{@group.name}</strong>"
      redirect_to tasks_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
