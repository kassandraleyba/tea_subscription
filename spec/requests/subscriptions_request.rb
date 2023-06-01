require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  before do
    @customer1 = create(:customer)
    @tea1 = create(:tea)
    @tea2 = create(:tea)
    @subscription1 = create(:subscription, customer: @customer1, tea: @tea1)
    @subscription2 = create(:subscription, customer: @customer1, tea: @tea2)
  end

  describe "/api/v1/customers/:customer_id/subscriptions" do
    it "returns all subscriptions for a customer" do
      get "/api/v1/customers/#{@customer1.id}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end