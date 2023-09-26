class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :api_key


#   def as_json
#     {
#   "data": {
#     "type": "users",
#     "id": "1",
#     "attributes": {
#       "email": "whatever@example.com",
#       "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
#     }
#   }
# }
#   end
end