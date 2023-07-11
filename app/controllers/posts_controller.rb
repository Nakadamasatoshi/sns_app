class PostsController < ApplicationController
 before_action :authenticate_user!
  
  def index
    #2-11で追加
    @title = params[:title]
    if @title.present?
      @posts = Post.where('title LIKE ?', "%#{@title}%")
    else
      @posts = Post.all
    end
    #ここまで
    render 'posts/index'
  end
  
  # 2-10で追加
  def new
    @post = Post.new
    render :new
  end
  
 def create
    @post = Post.new(post_params)

    if params[:post][:image]
      @post.image.attach(params[:post][:image])
    end
  
  if @post.save
    redirect_to index_post_path, notice: '登録しました'
  else
    render :new, status: :unprocessable_entity
  end
 end
  
 private
 def post_params
    params.require(:post).permit(:title, :body, :image)
 end
  #ここまで
end
