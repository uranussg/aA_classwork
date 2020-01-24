# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Like.destroy_all
Comment.destroy_all
Collection.destroy_all
Artwork.destroy_all
User.destroy_all

james = User.create(username: 'James')
songge = User.create(username: 'Songge')
ryan = User.create(username: 'Ryan')
joe = User.create(username: 'Joe')
alissa = User.create(username: 'Alissa')

cat01 = Artwork.create(title: 'cat01', image_url: 'https://icatcare.org/app/uploads/2018/06/Layer-1704-1920x840.jpg', artist_id: james.id, favorited: false)
cat02 = Artwork.create(title: 'cat02', image_url: 'https://thenypost.files.wordpress.com/2019/12/cat.jpg?quality=80&strip=all', artist_id: james.id, favorited: false)
cat03 = Artwork.create(title: 'cat03', image_url: 'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/otheayful_striped_cat_other/1800x1200_playful_striped_cat_other.jpg?resize=750px:*', artist_id: songge.id, favorited: false)
cat04 = Artwork.create(title: 'cat04', image_url: 'https://img.huffingtonpost.com/asset/5dcc613f1f00009304dee539.jpeg?cache=QaTFuOj2IM&ops=crop_834_777_4651_2994%2Cscalefit_720_noupscale', artist_id: alissa.id, favorited: false)

ArtworkShare.create(viewer_id: ryan.id, artwork_id: cat01.id)
ArtworkShare.create(viewer_id: joe.id, artwork_id: cat02.id)
ArtworkShare.create(viewer_id: james.id, artwork_id: cat03.id)
ArtworkShare.create(viewer_id: songge.id, artwork_id: cat04.id)
ArtworkShare.create(viewer_id: james.id, artwork_id: cat01.id)
ArtworkShare.create(viewer_id: songge.id, artwork_id: cat01.id)
ArtworkShare.create(viewer_id: ryan.id, artwork_id: cat02.id)
ArtworkShare.create(viewer_id: alissa.id, artwork_id: cat04.id)

c1 = Comment.create(user_id: james.id, artwork_id: cat04.id, body: "thats a fat cat")
c2 = Comment.create(user_id: songge.id, artwork_id: cat01.id, body: "thats a cute kitty")
c3 = Comment.create(user_id: joe.id, artwork_id: cat04.id, body: "looks like a mini bear")
c4 = Comment.create(user_id: alissa.id, artwork_id: cat02.id, body: "it needs shoes")
c5 = Comment.create(user_id: james.id, artwork_id: cat03.id, body: "on that catnip")

l1 = Like.create(user_id: james.id, likeable_id: cat04.id, likeable_type: :Artwork)
l2 = Like.create(user_id: james.id, likeable_id: c2.id, likeable_type: :Comment)
l3 = Like.create(user_id: songge.id, likeable_id: cat02.id, likeable_type: :Artwork) 
l4 = Like.create(user_id: ryan.id, likeable_id: c5.id, likeable_type: :Comment)
l5 = Like.create(user_id: alissa.id, likeable_id: cat03.id, likeable_type: :Artwork)
l6 = Like.create(user_id: joe.id, likeable_id: cat01.id, likeable_type: :Artwork)


Collection.create(title: 'fatcat', user_id: james.id, artwork_id: cat04.id)
Collection.create(title: 'cat', user_id: songge.id, artwork_id: cat04.id)
Collection.create(title: 'cat', user_id: songge.id, artwork_id: cat03.id)
Collection.create(title: 'cat', user_id: songge.id, artwork_id: cat02.id)
Collection.create(title: 'cat', user_id: songge.id, artwork_id: cat01.id)
