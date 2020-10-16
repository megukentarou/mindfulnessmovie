class UsersController < ApplicationController

  def imdex

  end

  def show
    @user = User.find(params[:id])
  end

  
end
