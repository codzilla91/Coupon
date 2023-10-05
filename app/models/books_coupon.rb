class BooksCoupon < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :discount, presence: true, numericality: { greater_than: 0 }
  validates :expires_at, presence: true

  def available?
    !expired? && (max_uses.nil? || used_count < max_uses)
  end

  def expired?
    expires_at.present? && expires_at < DateTime.now
  end

  def apply_discount(amount)
    [amount - discount, 0].max
  end
end
