class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:post_id])
    render :new
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to new_comment_path(params[:post_id]), notice: 'コメントしました'
    else
    
      @post = Post.find(params[:post_id])
      @comments = Comment.where(post_id: params[:post_id])
      render :new, status: :unprocessable_entity
    end
  end

#2-13課題で追加
  def new_topics
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
    @comments = Comment.where(topic_id: params[:topic_id])
    render :new_topics
  end
  
  def create_topics
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to new_comment_topics_path(params[:topic_id]), notice: 'コメントしました'
    else
    
      @topic = Topic.find(params[:topic_id])
      @comments = Comment.where(topic_id: params[:topic_id])
      render :new_topics, status: :unprocessable_entity
    end
  end

#ここまで
  private
  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])end
end