# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
CatRentalRequest.destroy_all
Cat.destroy_all


u1 = User.create(user_name: "banana", password: "go_bananas")
u2 = User.create(user_name: "apple", password: "go_apples")
u3 = User.create(user_name: "mango", password: "go_mangos")
u4 = User.create(user_name: "blueberry", password: "go_blueberries")


c01 = Cat.create!(user_id: u1.id, birth_date: '2015/01/20', name: 'Kitty', color: 'Black', sex: 'F', description: 'nice cat!')
c02 = Cat.create(user_id: u2.id, birth_date: '2014/01/20', name: 'Jone', color: 'Orange', sex: 'M', description: 'feral cat!')
c03 = Cat.create(user_id: u3.id, birth_date: '2015/04/10', name: 'Stephane', color: 'Blue', sex: 'M', description: 'a wild cat!!')
c04 = Cat.create(user_id: u3.id, birth_date: '2018/09/20', name: 'Baby', color: 'White', sex: 'F', description: 'baby cat!')
c05 = Cat.create(user_id: u3.id, birth_date: '2010/01/20', name: 'Nanny', color: 'Black', sex: 'F', description: 'old cat!')


CatRentalRequest.create(cat_id: c01.id, start_date: '2020/1/30', end_date: '2020/2/14')
CatRentalRequest.create(cat_id: c01.id, start_date: '2020/2/30', end_date: '2020/3/14')
CatRentalRequest.create(cat_id: c02.id, start_date: '2020/1/17', end_date: '2020/2/10')
CatRentalRequest.create(cat_id: c02.id, start_date: '2020/1/30', end_date: '2020/2/18')
CatRentalRequest.create(cat_id: c04.id, start_date: '2020/2/15', end_date: '2020/2/24')
CatRentalRequest.create(cat_id: c03.id, start_date: '2020/2/20', end_date: '2020/3/10')
CatRentalRequest.create(cat_id: c02.id, start_date: '2020/1/23', end_date: '2020/2/24')
CatRentalRequest.create(cat_id: c05.id, start_date: '2020/2/15', end_date: '2020/3/14')


