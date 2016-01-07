class Transaction < ActiveRecord::Base
  belongs_to :account
  attr_accessor :zip
  validate :non_zero
  
  def non_zero
    if (self.in == 0 || self.in.nil?) && (self.out == 0 || self.out.nil?)
      errors.add( :in,  "can't blank with out")
    end
  end
    
  def self.ins(id)
    @ins = Transaction.where(account_id:id).sum(:in)
  end
  
  def self.out(id)
    @out = Transaction.where(account_id:id).sum(:out)
  end
  
end
