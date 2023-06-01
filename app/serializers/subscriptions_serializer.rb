class SubscriptionsSerializer
	include JSONAPI::TeasSerializer

	set_type :subscription

	attributes :title, :price, :status, :frequency, :customer_id, :tea_id, :tea
end