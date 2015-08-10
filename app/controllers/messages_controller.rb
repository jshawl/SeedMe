class MessagesController < ApplicationController
  before_action :receiver

  def index
    @sent = current_user.sent_messages
    @received = current_user.received_messages.order(created_at: :desc)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create!(message_params.merge(sender: current_user, receiver: @receiver))
    if @message.save
      redirect_to user_path(@receiver), notice: "Your message has been sent!"
    else
      redirect_to :back, notice: "Something went wrong."
    end
  end

  def show
    @message = Message.find(params[:id])
    @user_is_message_sender = user_is_message_sender
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      message = "Message Deleted"
      redirect_to :back
      flash[:notice] = message
    end
  end
    private
    def message_params
      params.required(:message).permit(:subject, :body)
    end
    def user_is_message_sender
     # excellent! I tried to hack this but your code was bullet proof!
     # in the future, consider using a gem like cancancan for authorization
      current_user.id == @message.sender.id
    end

    def receiver
      @receiver = User.find(params[:user_id])
    end
end
