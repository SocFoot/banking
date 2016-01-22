class Conseille < ActiveRecord::Base
  validates :nom, presence:true
  validates :prenom, presence:true
  validate :all_nil?
  belongs_to :admin
  belongs_to :user
  belongs_to :account
  belongs_to :trans , foreign_key: "transaction_id", class_name: "Transaction"
  belongs_to :litige
  
  def all_nil?
    if (!self.user_id && !self.account_id && !self.transaction_id && !self.litige_id)
      errors.add( :in,  "can't ALL blank")
    end
  end
  
  def owner(user_id)
    if litige
      @lit = litige.owner(user_id)
    end
    if trans
      @tra = trans.owner(user_id)
    end
    if account
      @acc = account.owner(user_id)
    end
    if user
      user.id == user_id
    end
  end
  @lit || @tra ||  @acc || @us
end
