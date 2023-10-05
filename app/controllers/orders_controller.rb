class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # Apply the coupon discount if a valid coupon code is provided
      if params[:coupon_code].present?
        books_coupon = BooksCoupon.find_by(code: params[:coupon_code])
        if books_coupon&.available?
          @order.total_amount = books_coupon.apply_discount(@order.total_amount)
          books_coupon.increment!(:used_count)
        else
          flash[:alert] = 'Invalid or expired coupon code.'
          render :new
          return
        end
      end

      @order.save
      redirect_to root_path, notice: 'Order placed successfully.'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:total_amount, :coupon_code)
  end
end
