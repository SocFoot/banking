class Account < ActiveRecord::Base
  extend Tri
  validates :zip, uniqueness: true
  validates :zip, length: { is: 16, wrong_length: "%{count} should be 16" }
  validates :libelle, presence: true
  
  belongs_to :user 
  belongs_to :admin
  has_many :transactions
  has_many :conseilles
    
  def owner(user_id)
    if self == nil
      return false
    end
    user.id == user_id 
  end

  def ins
    Transaction.ins(self.id)
  end
  
  def out
    Transaction.out(self.id)
  end
  
  def solde
    ins - out
  end
  
end
