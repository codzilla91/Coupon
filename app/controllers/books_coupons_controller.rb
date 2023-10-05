class BooksCouponsController < ApplicationController
  def new
    @books_coupon = BooksCoupon.new
  end

  def create
    @books_coupon = BooksCoupon.new(books_coupon_params)
    if @books_coupon.save
      redirect_to books_coupons_path, notice: 'Coupon created successfully.'
    else
      render :new
    end
  end

  def index
    @books_coupons = BooksCoupon.all
  end

  private

  def books_coupon_params
    params.require(:books_coupon).permit(:code, :discount, :expires_at, :max_uses)
  end
end
