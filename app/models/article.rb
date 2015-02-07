class Article < ActiveRecord::Base
  validates :title, :text, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy
end
