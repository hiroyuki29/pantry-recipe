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

# MasterFood.seed do |s|
#     s.id = 1
#     s.name = 'トマト'
#     s.category_id = 1
#     s.unit_quantity = 1
#   end
  
#   MasterFood.seed do |s|
#     s.id = 2
#     s.name = 'キャベツ'
#     s.category_id = 1
#     s.unit_quantity = 1
#   end
  
#   MasterFood.seed do |s|
#     s.id = 3
#     s.name = 'レタス'
#     s.category_id = 1
#     s.unit_quantity = 1
#   end
  
#   MasterFood.seed do |s|
#     s.id = 4
#     s.name = '牛肩ロース'
#     s.category_id = 2
#     s.unit_quantity = 1
#   end
  
#   MasterFood.seed do |s|
#     s.id = 5
#     s.name = '豚バラ肉'
#     s.category_id = 2
#     s.unit_quantity = 1
#   end
  
#   MasterFood.seed do |s|
#     s.id = 6
#     s.name = 'さんま'
#     s.category_id = 3
#     s.unit_quantity = 1
#   end