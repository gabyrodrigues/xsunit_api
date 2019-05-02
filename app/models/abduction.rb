class Abduction < ApplicationRecord
  belongs_to :survivor
  validates :survivor, :abduted, presence: true
end
