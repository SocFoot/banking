class Epargne < ActiveRecord::Base
  validates :user_id, presence: true
  validates :rate, presence: true
  
  belongs_to :user
  has_many :epargne_types
  
  accepts_nested_attributes_for :epargne_types
end
