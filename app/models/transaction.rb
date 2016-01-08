class Transaction < ActiveRecord::Base
  
  attr_accessor :zip
  
  belongs_to :account
  has_many :litiges
  
  validate :non_zero
  
  def non_zero
    if (self.in == 0 || self.in.nil?) && (self.out == 0 || self.out.nil?)
      errors.add( :in,  "can't blank with out")
    end
  end
    
  def self.ins(id)
    @ins = Transaction.joins(:litiges).where(account_id:id).where(litiges:{status:"traité"}).sum(:in)
  end
  
  def self.out(id)
    @out = Transaction.joins(:litiges).where(account_id:id).where(litiges:{status:"traité"}).sum(:out)
  end
  
end
