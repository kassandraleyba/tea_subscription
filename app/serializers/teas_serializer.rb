class TeasSerializer
	include JSONAPI::Serializer
  
	set_type :tea
	
	attributes :name, 
						 :description, 
						 :temperature, 
						 :brew_time
end