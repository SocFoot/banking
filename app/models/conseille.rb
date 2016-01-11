class Conseille < ActiveRecord::Base
  validates :nom, presence:true
  validates :prenom, presence:true
  
  belongs_to :user
  belongs_to :account
  belongs_to :trans , foreign_key: "transaction_id", class_name: "Transaction"
  belongs_to :litige

end
