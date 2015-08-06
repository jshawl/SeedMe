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
  end
    private
    def message_params
      params.required(:message).permit(:subject, :body)
    end
    def receiver
      @receiver = User.find(params[:user_id])
    end
end
