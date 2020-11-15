class RoomsController < ApplicationController
  
  def index
    if user_signed_in?
      @companys = Company.all
      rooms = current_user.rooms
      @company_ids = []
      rooms.each do |r|
        @company_ids << r.company_id
      end
      
    elsif company_signed_in?
      @users = User.all
      rooms = current_company.rooms
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if user_signed_in?
      if @room.user_id == current_user.id
       @company = Company.find(@room.company_id)
      else
       redirect_to rooms_path
      end
    elsif company_signed_in?
      if @room.company_id == current_company.id
        @user = User.find(@room.user_id)
      else
        redirect_to rooms_path
      end
      
    else
      redirect_to rooms_path
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_company_params)
      @room.user_id = current_user.id
    elsif company_signed_in?
      @room = Room.new(room_user_params)
      @room.company_id = current_company.id
    else
      redirect_to rooms_path
    end
    
    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to rooms_path
    end
  end
  
  private
  def room_company_params
    params.require(:room).permit(:company_id)
  end
  
  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
