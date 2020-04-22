class Apartment < ApplicationRecord
  belongs_to :user

  has_many :residents, dependent: :destroy
end
