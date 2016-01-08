class User < ActiveRecord::Base
  validates :nom, presence: true
  validates :prenom, presence: true
  validates :sexe, presence: true
  validates :adresse, presence: true
  validates :nom, uniqueness: {scope: :prenom}
  has_secure_password
  
  after_destroy :admin_remains
  
  has_many :accounts
  has_many :epargnes

  private
  def admin_remains
    if User.count.zero?
      raise "Don't Delete Your Admin my friend!"
    end
  end
end
