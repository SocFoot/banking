class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
         
  validates :nom, presence: true
  validates :prenom, presence: true
  validates :sexe, presence: true
  validates :adresse, presence: true
  validates :nom, uniqueness: {scope: :prenom}
  
  after_destroy :admin_remains
  
  has_many :accounts
  has_many :epargnes
  has_many :conseilles
  
  private
  def admin_remains
    if User.count.zero?
      raise "Don't Delete Your Admin my friend!"
    end
  end
end
