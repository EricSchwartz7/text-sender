class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(outgoing_params)
    @message[:incoming] = false

    respond_to do |format|
      if @message.save
        TwilioTextMessenger.new(@message.text, @message.phone_number).send_text
        format.html { redirect_to messages_url, notice: "Message was successfully sent." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def receive_text
    @message = Message.build_incoming_message(incoming_params)
    # respond_to do |format|
      if @message.save
        response = Twilio::TwiML::MessagingResponse.new do |r|
          r.message body: "Message received: #{@message.text}"
        end
        render xml: response.to_s
      else
        response = Twilio::TwiML::MessagingResponse.new do |r|
          r.message body: "Something went wrong."
        end
        render xml: response.to_s
      end
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outgoing_params
      params.require(:message).permit(:name, :phone_number, :text, :incoming)
    end

    def incoming_params
      params.permit(:FromCity, :From, :Body)
    end
end
