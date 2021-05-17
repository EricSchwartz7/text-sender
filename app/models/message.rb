class Message < ApplicationRecord
    validates :phone_number, presence: true
    validates :text, presence: true
end