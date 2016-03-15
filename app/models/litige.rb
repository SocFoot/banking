class Litige < ActiveRecord::Base
  
  validates :motif, presence:true
  validates :identifiant, uniqueness:true
  validate :good_identifiant
  
  belongs_to :trans , foreign_key: "transaction_id", class_name: "Transaction"
  belongs_to :conseille
  
  scope :tri, -> (user_id){joins(trans: {account: :user}).order("zip").where('users.id' => user_id)}
  
  def owner(user_id)
    if self == nil
      return false
    end
    trans.account.user.id == user_id 
  end
  
  def good_identifiant
    if !( self.identifiant =~ /\A[A-Z]{2}\d{3}\z/ )
      errors.add( :in,  "bad identifant")
    end
  end
  
  def self.idenfifiant_generator(letters,number)
    self.upcase_random_letters(letters) +  self.random_numbers(number)
  end
  
  private
  
  def self.upcase_random_letters(length)
    length = length - 1
    ALPHABET_LIST.shuffle[0..length].join("").upcase
  end
  
  def self.random_numbers(size)
    size = size - 1
    NUMBER_LIST.shuffle[0..size].join("")
  end
  
  
end
