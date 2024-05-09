class RoomsController < ApplicationController
  def index
    @rooms = Room.public_rooms
    @users = User.all_except(Current.user) # Este scope está definido en el modelo user
  end
end
