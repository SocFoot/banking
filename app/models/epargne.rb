class Epargne < ActiveRecord::Base
  extend Tri

  validates :rate, presence: true
  
  belongs_to :user
  belongs_to :admin
  has_many :epargne_types
  has_many :conseilles
  
  accepts_nested_attributes_for :epargne_types
  
  def owner(user_id)
    if self == nil
      return false
    end
    user.id == user_id 
  end
end
