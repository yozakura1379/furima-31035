class Item < ApplicationRecord
  has_many :purchases
  belongs_to :user
  has_one_attached :image
  validate :image_presence

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :days
  belongs_to :delivery_fee
  belongs_to :prefecture
  # カラム１つ１つにアソシエーションを組む

  # 空の投稿を保存できないようにする
  validates :name, :about, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :days_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  # ジャンルの選択が「--」の時は保存できないようにする

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

  def image_presence
    image.attached?
    # これで画像がなければfalseになる
  end
end