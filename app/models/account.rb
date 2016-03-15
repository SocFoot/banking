class Account < ActiveRecord::Base
  extend Tri
  validates :zip, uniqueness: true
  validates :zip, length: { is: 16, wrong_length: "%{count} should be 16" }
  validates :libelle, presence: true

  
  belongs_to :user 
  belongs_to :admin
  has_many :transactions
  belongs_to :conseille
    
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

  #generate random zip code
  def self.random_zip
    a = "" 
    16.times{ a = ([0,1,2,3,4,5,6,7,8,9].shuffle[0].to_s + a) }
    a
  end
  
  #generate random fake_id
  def self.random_fake
    Account.all.to_a.each do |account|
      if !account.fake_id 
        account.update(fake_id:SecureRandom.random_number(1000000000))
      end
    end
  end
end
