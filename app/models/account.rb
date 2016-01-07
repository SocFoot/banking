class Account < ActiveRecord::Base
  
  validates :zip, uniqueness: true
  validates :zip, length: { is: 16, wrong_length: "%{count} should be 16" }
  
  belongs_to :user 
  
end
