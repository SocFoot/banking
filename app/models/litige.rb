class Litige < ActiveRecord::Base
  
  validates :status, presence:true
  validates :motif, presence:true
  validates :identifiant, uniqueness:true
  validate :good_identifiant
  
  belongs_to :trans , foreign_key: "transaction_id", class_name: "Transaction"
  scope :tri, -> (user_id){joins(trans: {account: :user}).order("zip").where('users.id' => user_id)}
  def good_identifiant
    if !( self.identifiant =~ /\A[A-Z]{2}\d{3}\z/ )
      errors.add( :in,  "bad identifant")
    end
  end
end
