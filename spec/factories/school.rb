# FactoryBot.define do
#   factory :school, class School do
#     sequence :name {|n| "School#{n}"}
#     address { name + ' Address' }
#   end

# factory :recipient, class Recipient do
#   sequence :name {|n| "Recipient#{n}"}
#   address { name + ' Address' }
#   association :school, factory :school
# end

# factory :order, class Order do
#   association :school, factory :school
#   status { 1 }
#   date {Date.today + rand(1..100)}
#   attributes_for(:order_items) do
#     association :recipient, factory :recipient
#     gift_type {rand(1..4)}
#     quantity {rand(1..60)}
#   end
# end

# end
