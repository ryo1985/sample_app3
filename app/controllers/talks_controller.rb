class TalksController < ApplicationController
  before_action :signed_in_user, only: [ :destroy, :create ]
  before_action :correct_user,   only: :destroy

  def index
  end

  def create
    @talk = current_user.talks.build(talk_params)
    
	if @talk.save!
      flash[:success] = "Talk created!"	
	  redirect_to root_url
	else
	  @feed_items = []
	  render 'static_pages/home'
	end  
  end

  def destroy
    @talk.destroy
	redirect_to root_url
  end

  def following
  @title = "Talkers"
	@user = User.find(params[:id])
	@users = @user.followed_users.paginate(page: params[:page])
	@usertalk = current_user.talks.build(from_id: current_user.id)
	render 'show_follow'
  end
  
  def test
    @title = "Talkers"
	@user = User.find(params[:id])
	@users = current_user.followed_users.paginate(page: params[:page])
	@usertalk = current_user.talks.build(from_id: current_user.id, to_id: params[:to_id])
	render 'show_test'      
  end
  
  private

    def talk_params
      params.require(:talk).permit(:from_id, :to_id, :content, :picture)
    end

    def correct_user
	  @talk = current_user.talks.find_by(id: params[:id])
      redirect_to root_url if @talk.nil?
    end	
end