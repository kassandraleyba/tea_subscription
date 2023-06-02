require 'rails_helper'

RSpec.describe "Cancel Customer Subscriptions", type: :request do
  before do
    @customer1 = create(:customer)
    @tea1 = create(:tea)
    @tea2 = create(:tea)
    @subscription1 = create(:subscription, customer_id: @customer1.id, tea_id: @tea1.id)
    @subscription2 = create(:subscription, customer_id: @customer1.id, tea_id: @tea2.id)
  end

  it "can delete a subscription for a customer" do
    delete "/api/v1/customers/#{@customer1[:id]}/subscriptions/#{@subscription1[:id]}"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)["message"]).to eq("Subscription successfully cancelled")
  end
end