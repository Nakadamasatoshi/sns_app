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
  #ここまで
  #2-12課題で追加
  def edit
    @topic = Topic.find(params[:id])
    render :edit
  end
  
  def update
    @topic = Topic.find(params[:id])
    if params[:topic][:image]
      @topic.image.attach(params[:topic][:image])
    end
    if @topic.update(topic_params)
      redirect_to index_topics_path, notice: '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to index_topics_path, notice:'削除しました'
  end
#ここまで

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
