class StoreReceiptsController < ApplicationController

  def create
    @store_receipt = StoreReceipt.create(receipt_params)
  end

private

  def receipt_params
    params.require(:store_receipt).permit(:order_item_id, :receipt_amount, :receipt_date)
  end

end
