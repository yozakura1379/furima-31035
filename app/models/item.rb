class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :days
  belongs_to :delivery_fee
  belongs_to :prefecture
  # カラム１つ１つにアソシエーションを組む

  # 空の投稿を保存できないようにする

  with_options presence: true do
    validates :name
    validates :image
    validates :about
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_id
    validates :price, numericality: { greater_than_or_equal_to: 300 }
    validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :days_id
    validates :prefecture_id

    # ジャンルの選択が「--」(id.1)の時は保存できないようにする
  end


end
