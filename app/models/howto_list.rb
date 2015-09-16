class HowtoList < ActiveRecord::Base
  validates :name, presence: true
  validates :author, presence: true
  has_many :steps
end
