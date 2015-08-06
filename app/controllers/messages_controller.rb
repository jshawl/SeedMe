class MessagesController < ApplicationController
  before_action :receiver, only: [:new, :create]

  def index
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
    private
    def message_params
      params.required(:message).permit(:subject, :body)
    end
    def receiver
      @receiver = User.find(params[:user_id])
    end
end
