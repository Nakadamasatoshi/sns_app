class TopicsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    render 'posts/index'
  end
 
 # ここから 
  def new
    @topic =Topic.new
    render :new
  end

  def create
    @topic =Topic.new(post_params)
    
    if @topic.save
      redirect_to new_topics_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:topic).permit(:title, :body, :image)
  end
  #ここまで
end
