class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # attr_accessible :name , :email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  has_many :likes, foreign_key: 'author_id', dependent: :delete_all

  has_many :comments, foreign_key: 'author_id', dependent: :delete_all

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true }

  def recent_post
    posts.includes(:comments, :likes).order('created_at Desc').limit(3)
  end

  def admin?
    role == 'admin'
  end
end
