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
    
    if params[:profile][:image]
      @profile.image.attach(params[:profile][:image])
    end
    
    if @profile.save
      redirect_to index_post_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  def profile_params
    params.require(:profile).permit(:name, :address, :age, :sex).merge(user_id: params[:user_id])
  end
  
  
end
