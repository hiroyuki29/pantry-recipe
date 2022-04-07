require 'csv'

csv = CSV.read('db/fixtures/item.csv')
csv.each do |food|
  Item.seed do |s|
    s.id = food[0]
    s.name = food[1]
    s.category_id = food[2]
    s.master_food_id = food[3]
    s.unit_quantity = food[4]
  end
end