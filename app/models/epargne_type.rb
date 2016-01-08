class EpargneType < ActiveRecord::Base
  validates :nom, uniqueness: true
  validates :nom, presence: true
  
  belongs_to :epargne
end
