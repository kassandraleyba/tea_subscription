require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  before do
    @customer1 = create(:customer)
    @tea1 = create(:tea)
    @tea2 = create(:tea)
    @subscription1 = create(:subscription, status: "active", frequency: "weekly", customer: @customer1, tea: @tea1)
    @subscription2 = create(:subscription, status: "inactive", frequency: "monthly", customer: @customer1, tea: @tea2)
  end

  describe "/api/v1/customers/:customer_id/subscriptions" do
    it "returns all subscriptions for a customer" do
      get "/api/v1/customers/#{@customer1.id}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it "returns an error message when a customer does not exist" do
      get "/api/v1/customers/999/subscriptions"
    
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(response.body).to eq("{\"errors\":\"Customer could not be found\"}")
    end

    it "prompts user to add a subscription if the customer has none" do
      customer2 = create(:customer)

      get "/api/v1/customers/#{customer2.id}/subscriptions"

      expect(customer2.subscriptions.count).to eq(0)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to eq("{\"message\":\"Customer has no subscriptions. Please add subscriptions.\"}")
    end
  end
end