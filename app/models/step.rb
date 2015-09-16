class Step < ActiveRecord::Base
  belongs_to :howto_list
  validates :description, presence: true
end
