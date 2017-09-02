class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :house_id, presence: true
  belongs_to :house
end
