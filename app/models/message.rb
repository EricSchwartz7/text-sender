class Message < ApplicationRecord
    validates :phone_number, presence: true
    validates :text, presence: true

    def self.build_incoming_message(incoming_params)
        Message.new(
          name: incoming_params[:FromCity], 
          phone_number: incoming_params[:From], 
          text: incoming_params[:Body],
          incoming: true
        )
    end
end