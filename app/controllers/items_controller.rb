class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def get
  end

  def create
    redirect_to root_path
  end

  def destroy
    redirect_to root_path
  end
end
