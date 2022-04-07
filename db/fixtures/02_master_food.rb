require 'csv'

csv = CSV.read('db/fixtures/master_food.csv')
csv.each do |food|
  MasterFood.seed do |s|
    s.id = food[0]
    s.name = food[1]
    s.category_id = food[2]
    s.unit_quantity = food[3]
  end
end
