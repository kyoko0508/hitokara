class User < ApplicationRecord
    authenticates_with_sorcery!

    has_many :likes, dependent: :destroy
    has_many :liked_shops, through: :likes, source: :shop
  
    validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
    validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
    validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :name, presence: true, length: { maximum: 255 }

    def like(shop)
      liked_shops << shop
    end
  
    def unlike(shop)
      liked_shops.delete shop
    end
  
    def like?(shop)
      liked_shops.include? shop
    end
  end