class User::MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def confirm
    @message = Message.new(message_params)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      MessageMailer.message_mail(@message).deliver #ﾒｰﾙ送信処理
      redirect_to complete_messages_path
    else
      render :new
    end
  end

  def complete
  end


  private


  def message_params
    params.require(:message).permit(:name, :email, :message)
  end
end
