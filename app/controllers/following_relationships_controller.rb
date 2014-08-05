class FollowingRelationshipsController < ApplicationController
  def create
    current_user.follow user
    flash[:success] = "Now following user."
    redirect_to user
  end

  def destroy
    current_user.unfollow user
    flash[:danger] = "No longer following user."
    redirect_to user
  end

  private

  def user
    @_user ||= User.find(params[:user_id])
  end
end