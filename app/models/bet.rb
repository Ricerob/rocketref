class Bet < ApplicationRecord
    validates :bet, presence: true
    belongs_to :user
end
