class Conseille < ActiveRecord::Base
  validates :nom, presence:true
  validates :prenom, presence:true
  validate do 
    empty_attributes(:nom, :prenom)
  end
  has_many :admins
  has_many :users
  has_many :accounts
  has_many :epargnes
  has_many :transactions , foreign_key: "transaction_id", class_name: "Transaction"
  has_many :litiges
  
  def empty_attributes(*attributes)
    if check_empty?(attributes[0])
      errors.add( :in,  "empty")
    end
  end
  
  private
    def check_empty?(*attributes)
      val = true
      attributes.each do |attri| 
        val = val && send(attri).empty? if send(attri)
      end
      val
    end
  
  def nom_prenom
    "#{nom} #{prenom}"
  end
end
