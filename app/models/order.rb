class Order < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum :status, {
    pending: "pending",
    accepted: "accepted",
    delivering: "delivering",
    delivered: "delivered",
    cancel: "cancel"
  }

  private

  def set_defaults
    self.status ||= :pending
  end

end
