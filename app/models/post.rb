class Post < ActiveRecord::Base
  validates :title, presence: true

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

end
