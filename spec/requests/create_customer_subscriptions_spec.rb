require 'rails_helper'

RSpec.describe "Create Customer Subscriptions", type: :request do
  before do
    @customer1 = create(:customer)
    @tea1 = create(:tea)
  end

  it "can create a new subscription for a customer" do
    subscription_params = {
      subscription: {
        title: "Monthly Green Tea",
        price: 10.00,
        status: "active",
        frequency: "monthly",
        customer_id: @customer1.id,
        tea_id: @tea1.id
      }
    }

    post "/api/v1/customers/#{@customer1.id}/subscriptions", params: subscription_params

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(JSON.parse(response.body)["data"]["attributes"]["title"]).to eq(subscription_params[:subscription][:title])
  end

  it "cannot create a new subscription for a customer without a price" do
    subscription_params = {
      subscription: {
        title: "Monthly Green Tea",
        price: "",
        status: "active",
        frequency: "monthly",
        customer_id: @customer1.id,
        tea_id: @tea1.id
      }
    }

    post "/api/v1/customers/#{subscription_params[:subscription][:customer_id]}/subscriptions", params: subscription_params

    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)["errors"]).to eq("Price can't be blank")
  end

  it "cannot create a new subscription for a customer with a price less than 0" do
    subscription_params = {
      subscription: {
        title: "Monthly Green Tea",
        price: -10.00,
        status: "active",
        frequency: "monthly",
        customer_id: @customer1.id,
        tea_id: @tea1.id
      }
    }

    post "/api/v1/customers/#{subscription_params[:subscription][:customer_id]}/subscriptions", params: subscription_params

    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)["errors"]).to eq("Price must be greater than 0")
  end

  it "cannot create a new subscription for a customer without a customer id" do
    subscription_params = {
      subscription: {
        title: "Monthly Green Tea",
        price: 10.00,
        status: "active",
        frequency: "monthly",
        customer_id: 9999,
        tea_id: @tea1.id
      }
    }

    post "/api/v1/customers/#{subscription_params[:subscription][:customer_id]}/subscriptions", params: subscription_params

    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)["errors"]).to eq("Customer must exist")
  end

  it "cannot create a new subscription for a customer without a tea id" do
    subscription_params = {
      subscription: {
        title: "Monthly Green Tea",
        price: 10.00,
        status: "active",
        frequency: "monthly",
        customer_id: @customer1.id,
        tea_id: 9999
      }
    }

    post "/api/v1/customers/#{subscription_params[:subscription][:customer_id]}/subscriptions", params: subscription_params

    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)["errors"]).to eq("Tea must exist")
  end
end