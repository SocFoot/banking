class Account < ActiveRecord::Base
  
  validates :zip, uniqueness: true
  validates :zip, length: { is: 16, wrong_length: "%{count} should be 16" }
  
  belongs_to :user 
  has_many :transactions

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
