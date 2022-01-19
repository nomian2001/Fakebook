class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through:  :inverse_friendships, source: :user

  scope :all_except, ->(user) { where.not(id: (user.friends + [user]).map(&:id))}
  validates_presence_of     :email 
  validates_presence_of     :username 
  validates_uniqueness_of   :username  
  validates_presence_of     :password, if: :password_required? 
  validates_confirmation_of :password, if: :password_required? 
  validates_length_of       :password, within: password_length, allow_blank: true
end
