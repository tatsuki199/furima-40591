class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :load
  belongs_to :region
  belongs_to :delivery
  belongs_to :user

  has_one_attached :image

  # has_one :purchase

  #空の投稿を保存できないようにする
  validates :name, :explanation, presence: true
  validate :image_attached?

  private

  def image_attached?
    errors.add(:image, 'を添付してください') unless image.attached?
  end
  
  #ジャンルの選択が「---」の時は保存できないようにする  
  validates :category_id, :situation_id, :load_id, :region_id, :delivery_id, numericality: { other_than: 1 ,message: "can't be blank"}
  
  #価格は￥300～￥9,999,999の間のみ保存可能にする
  validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
