class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  
  validates :email, presence: true,
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は有効な形式で入力してください" }
  
  validates :password, presence: true,
            length: { minimum: 6 },
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字の混合で入力してください" } 

  validates :first_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角文字で入力してください" }

  validates :last_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角文字で入力してください" }

  validates :first_name_kana, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }

  validates :last_name_kana, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }




  validates :birthday, presence: true


  
end
