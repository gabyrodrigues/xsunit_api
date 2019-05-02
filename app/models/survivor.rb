class Survivor < ApplicationRecord
	validates :name, presence: true
	has_many :abductions, dependent: :destroy
end
