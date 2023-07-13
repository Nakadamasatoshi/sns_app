class TopicsController < ApplicationController
  before_action :authenticate_user!
  
  #2-11課題で追加。@postsを@topicsに変更
  def index
    @title = params[ :title]
    if @title.present?
      @topics = Topic.where('title LIKE ?', "%#{@title}%")
    else
      @topics = Topic.all
    end
    render 'index'
  end
  #ここまで
 
 # ここから 
  def new
    @topic =Topic.new
    render :new
  end

  def create
    @topic =Topic.new(topic_params)
    
    if @topic.save
      redirect_to index_topics_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
  #ここまで
end
