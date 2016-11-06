class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @proposals = @user.proposals.search(params)
  end
end
