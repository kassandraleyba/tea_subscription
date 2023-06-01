class Api::V1::SubscriptionsController < ApplicationController
  def index
    if !Customer.exists?(params[:customer_id])
      render json: { errors: "Customer could not be found" }, status: 404 
    elsif Customer.find(params[:customer_id]).subscriptions.empty?
      render  json: { message: "Customer has no subscriptions. Please add subscriptions." }
    elsif Customer.exists?(params[:customer_id])
      render json: SubscriptionSerializer.new(Customer.find(params[:customer_id]).subscriptions)
    end
  end
end