class MessagesController < ApplicationController
  def create
    @message = Current.user.messages.new(message_params)
    @message.room_id = params[:room_id]
    @message.save!
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
