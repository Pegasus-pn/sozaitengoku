class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :materials, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, presence: true

  def already_liked?(material)
    self.likes.exists?(material_id: material.id)
  end

end
