class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])

    render json: SubscriptionsSerializer.new(customer.subscriptions)
  end
end