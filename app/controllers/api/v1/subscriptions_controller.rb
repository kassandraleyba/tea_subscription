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

  def create
    subscription = Subscription.new(subscription_params)
   
    if subscription.price.nil?
      render json: { errors: "Price can't be blank" }, status: 400
    elsif subscription.price <= 0
        render json: { errors: "Price must be greater than 0" }, status: 400
    elsif subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { errors: subscription.errors.full_messages.to_sentence }, status: 400
    end
  end

  def update
    subscription = Subscription.find_by(id: params[:id], customer_id: params[:customer_id])
  
    if subscription
      if subscription.status == "active"
        subscription.update(status: "inactive")
        render json: SubscriptionSerializer.new(subscription), status: 200
      else
        subscription.update(status: "active")
        render json: SubscriptionSerializer.new(subscription), status: 200
      end
    else
      render json: { message: "Subscription could not be found" }, status: 404
    end
  end
  
  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end