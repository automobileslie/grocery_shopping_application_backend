class ReceiptsController < ApplicationController

  # GET /receipts or /receipts.json
  def index
    @receipts = Receipt.all
    render "receipts/index"
  end

  def process(args)
    # if a receipt_id is included in the request, that means the user is making a request to '/receipts/:receipt_id/points'
    # to get the points earned from that receipt, so calculate those points and return them to the user here
    # logic for calculating points would be factored out to a method in a separate component in the future and called here
    if params[:receipt_id]
      receipt = Receipt.find(params[:receipt_id])
      items_purchased = receipt.items
      total = receipt.total

      point_count = 0

      # add a point for each alphanumeric character in the retailer name
      receipt.retailer.chars().each do |character|
        if character.match(/\A[a-zA-Z0-9]*\z/)
          point_count += 1
        end
      end

      # checking whether the purchase was between 2 and 4 pm
      # this could be updated to take the customer's timezone into consideration, but right now it is just checking UTC 
      # of when the receipt was generated in our system
      # if the customer was submitting a receipt generated elsewhere and we were rewarding points based on that information, 
      # I would add date and time attributes to the receipt table to account for that and would check those here
      hour_receipt_generated = (receipt.created_at.strftime("%I")).to_i
      minutes_receipt_generated = (receipt.created_at.strftime("%M")).to_i
      seconds_receipted_generated = (receipt.created_at.strftime("%S")).to_i

      if (hour_receipt_generated == 14 && minutes_receipt_generated > 0) || (hour_receipt_generated == 14 && seconds_receipt_generated > 0)
          points_count += 10
      elsif hour_receipt_generated == 15
          points_count += 10
      end

      # add points if the date of purchase was on an odd day, for example 27
      date_of_receipt = (receipt.created_at.strftime("%d")).to_i
      if date_of_receipt.modulo(2) > 0
        point_count += 6
      end

      # add a point for every two items purchased
      point_count += (((items_purchased.length).to_f)/2.0).floor

      # if the total is a round dollar amount, add 50 points
      if (total.to_f == total.to_f.floor())
        point_count += 50
      end

      items_purchased.each do |item|
        description_length = item.short_description.strip.length
        if description_length.modulo(3) == 0
          point_count += (item.price.to_f * 0.20).round()
        end

        # add 25 points if the price is a multiple of .25
        if (item.price.to_f.modulo(0.25) == 0)
          point_count += 25
        end
      end

      render json: {points: point_count}

    # if the params do not include a receipt_id, that means the user is completing a purchase and needs a receipt
    else
      receipt = Receipt.create!(retailer: "Target")

      params["items_purchased"].each do |id|
        Purchase.create!(item_id: id, receipt_id: receipt.id)
      end

      items_purchased = receipt.items

      total = "0.00"

      items_purchased.each do |item|
        total = (BigDecimal(total) + BigDecimal(item.price)).to_s
      end

      receipt.total = total
      receipt.save!

      render json: {id: receipt.id}
    end
  end
end
