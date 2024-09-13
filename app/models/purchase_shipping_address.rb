class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipalities, :street_address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id, :municipalities, :street_address, :token
    validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :telephone_number, numericality: { only_integer: true }, length: { in: 10..11 }
  end

  def save
    purchase = Purchase.create(user_id:, item_id:)
    ShippingAddress.create(post_code:, region_id:, municipalities:,
                           street_address:, building_name:, telephone_number:, purchase_id: purchase.id)
  end
end
