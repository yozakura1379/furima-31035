class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do # ここでdoにすることで１つ１つやなくて済む
    validates :nickname
    # EMAIL_REGEX = /.+@.+/.freeze # .と+で＠の前は１つ以上の文字列があるという意味になる、.+の間に＠を挟むことで＠を含めないとダメと言うことになる
    # validates_format_of :email, with: EMAIL_REGEX, message: '@を含めて設定してください'
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    NAME_REGEX_ALIAS = /\A[ァ-ヶー－]+\z/.freeze # カタカナのみの場合はンで終わるのではなくケで終わるようにする
    validates_format_of :password, with: PASSWORD_REGEX, message: '6文字以上の半角英数字'
    validates :firstname, format: { with: NAME_REGEX }
    validates :lastname, format: { with: NAME_REGEX }
    validates :firstname_alias, format: { with: NAME_REGEX_ALIAS }
    validates :lastname_alias, format: { with:  NAME_REGEX_ALIAS }
    validates :birthday
  end
end
