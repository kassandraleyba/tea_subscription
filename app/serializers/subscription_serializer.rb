class SubscriptionSerializer
	include JSONAPI::Serializer

	set_type :subscription

	attributes :title, 
						 :price, 
						 :status, 
						 :frequency, 
						 :customer_id, 
						 :tea_id 
end