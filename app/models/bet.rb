class Bet < ApplicationRecord
  belongs_to :user_combat
  belongs_to :user

  validates :sum_bet, presence: true
  validates_numericality_of :sum_bet, :greater_than_or_equal_to => 5, 
  :less_than_or_equal_to => 100

end
