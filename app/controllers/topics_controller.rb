class TopicsController < ApplicationController
  def new
    render :new
  end


  def create
    redirect_to edit_topics_path
  end

  def edit
    render :edit
  end

  def update
    redirect_to update_topics_path
  end
end
