class Account < ActiveRecord::Base
  extend Tri
  validates :zip, uniqueness: true
  validates :zip, length: { is: 16, wrong_length: "%{count} should be 16" }
  
  belongs_to :user 
  has_many :transactions
  
  scope :tri, -> { joins(:user).order("prenom")}

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
