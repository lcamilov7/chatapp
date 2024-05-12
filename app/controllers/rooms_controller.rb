class RoomsController < ApplicationController
  def index
    @rooms = Room.public_rooms
    @users = User.all_except(Current.user) # Este scope está definido en el modelo user
    @room = Room.new
  end

  def show
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(Current.user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages

    render :index
  end

  def create
    @room = Room.create(room_params)
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
