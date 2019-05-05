class Abduction < ApplicationRecord
  belongs_to :survivor
  validates :survivor, :abducted, presence: true
end
