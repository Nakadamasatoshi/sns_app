class ProfileController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user.id
    @profile = Profile.find_by(user_id: @user)
      if @profile.present?
        render :show
      else
        redirect_to new_profile_path
      end
  end
  
  def new
    @profile = Profile.new
    render :new
  end
  
  def create
    
    @profile = Profile.new(profile_params)
    #この部分を追加と指摘を受ける（セキュリティ上必須）
    @profile.user_id = current_user.id
    #ここまで
    if params[:profile][:image]
      @profile.image.attach(params[:profile][:image])
    end
    
    if @profile.save
      redirect_to index_post_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @profile = Profile.find(params[:id])
    render :edit
  end
#プロフィールの登録に必要
  def update
    @profile = Profile.find(params[:id])
    if params[:profile][:image]
      @profile.image.attach(params[:profile][:image])
    end
    if @profile.update(profile_params)
      redirect_to show_profile_path, notice: '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  #ここまで
  
  private
  def profile_params
    params.require(:profile).permit(:name, :address, :age, :sex)
  end
  
  
end
