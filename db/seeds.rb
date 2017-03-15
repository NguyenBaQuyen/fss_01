User.create name: "admin", email: "admin@gmail.com", password: "111111",
  role: 0, remote_avatar_url: "http://ibcconsultant.com/wp-content/uploads/2015/08/avatar.png"
(1..10).each do |i|
  User.create name: "user #{i}", email: "user_#{i}@gmail.com",
    password: "111111", role: 1,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    country: "Việt Nam",
    remote_avatar_url: "http://ibcconsultant.com/wp-content/uploads/2015/08/avatar.png"
end

User.order("RAND()").first.recipes.create name: "Cơm rang dưa bò",
  description: "Cơm rang dưa bò + hành tây",
  remote_cover_url: "http://media.phunutoday.vn/files/upload_images/2014/11/22/com-rang-dua-bo.jpg",
  duration: 20, status: 1

User.order("RAND()").first.recipes.create name: "mì xào thịt viên",
  description: "Mì ý xào thịt viên",
  remote_cover_url: "http://images.media-allrecipes.com/userphotos/560x315/1077229.jpg",
  duration: 20, status: 1

User.order("RAND()").first.recipes.create name: "rau củ nướng",
  description: "rau củ nướng",
  remote_cover_url: "http://images.media-allrecipes.com/userphotos/560x315/1486.jpg",
  duration: 20, status: 1

User.order("RAND()").first.recipes.create name: "mỳ pasta",
  description: "A delicious, easy company dish - the flavors are wonderful. A favorite with my family. I usually double the recipe so we can have leftovers.",
  remote_cover_url: "http://images.media-allrecipes.com/userphotos/560x315/525185.jpg",
  duration: 20, status: 1

User.order("RAND()").first.recipes.create name: "Cá ngừ Alaska & Tôm",
  description: "món ăn cao cấp",
  remote_cover_url: "http://images.media-allrecipes.com/userphotos/560x315/776261.jpg",
  duration: 20, status: 1

User.order("RAND()").first.recipes.create name: "xa lát cua",
  description: "xa lát cua",
  remote_cover_url: "http://images.media-allrecipes.com/userphotos/560x315/4260708.jpg",
  duration: 20, status: 1

User.order("RAND()").first.recipes.create name: "Cơm cháy tôm xào",
  description: "món ăn thích hợp với dân phượt",
  remote_cover_url: "https://media.cooky.vn/recipe/g1/3599/s400x400/recipe3599-636217136789615370.jpg",
  duration: 20, status: 1

User.second.recipes.create name: "Cha ca",
  description: "Cha ca + hành tây",
  remote_cover_url: "http://media.phunutoday.vn/files/uplo"\
    "ad_images/2014/11/22/com-rang-dua-bo.jpg",
  duration: 20,
  status: 0

User.second.recipes.create name: "Thi ham",
  description: "Thi ham + hành tây",
  remote_cover_url: "http://media.phunutoday.vn/files/uplo"\
    "ad_images/2014/11/22/com-rang-dua-bo.jpg",
  duration: 20,
  status: 2

CategoryGroup.create name: "Độ khó"
CategoryGroup.create name: "Cách làm"
CategoryGroup.create name: "Mùa & lễ"
CategoryGroup.create name: "Quốc gia"
CategoryGroup.first.categories.create name: "Dễ"
CategoryGroup.first.categories.create name: "Trung bình"
CategoryGroup.first.categories.create name: "Khó"
CategoryGroup.second.categories.create name: "Luộc"
CategoryGroup.second.categories.create name: "Chiên, rán"
CategoryGroup.second.categories.create name: "xào"
CategoryGroup.second.categories.create name: "hấp"
CategoryGroup.second.categories.create name: "nướng"
CategoryGroup.find(3).categories.create name: "tết"
CategoryGroup.find(3).categories.create name: "valentine"
CategoryGroup.find(3).categories.create name: "cưới hỏi"
CategoryGroup.find(3).categories.create name: "sinh nhật"
CategoryGroup.find(4).categories.create name: "Việt Nam"
CategoryGroup.find(4).categories.create name: "Nhật Bản"
CategoryGroup.find(4).categories.create name: "Trung Quốc"
CategoryGroup.find(4).categories.create name: "Hàn Quốc"

CategoriesRecipe.create recipe: Recipe.first, category: Category.find_by(name: "Dễ")
CategoriesRecipe.create recipe: Recipe.first, category: Category.find_by(name: "Chiên, rán")
CategoriesRecipe.create recipe: Recipe.first, category: Category.find_by(name: "Việt Nam")

Recipe.first.materials.create name: "cơm"
Recipe.first.materials.create name: "trứng", number: 2, unit: "quả"
Recipe.first.materials.create name: "hành, tỏi, hạt tiêu"
Recipe.first.steps.create content: "phi hành tỏi", order: 0
Recipe.first.steps.create content: "đổ cơm vào", order: 1
Recipe.first.steps.create content: "cho trứng vào", order: 2
Recipe.first.steps.create content: "ăn", order: 3

Recipe.first.comments.create(user: User.find(2), content: "tuyệt vời ^^")
Recipe.first.comments.create(user: User.find(3), content: "ngon quá ^^")

Collection.create(user: User.first, name: "các món ăn chay",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
  remote_cover_url: "https://media.cooky.vn/recipe/g1/603/s400x400/recipe603-635546762561613309.jpg")
Collection.create(user: User.first, name: "các món nem",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
  remote_cover_url: "https://media.cooky.vn/recipe/g1/4310/s400x400/recipe4310-635811207621569601.jpg")
Collection.create(user: User.first, name: "các món ăn Hà Nội",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
  remote_cover_url: "https://media.cooky.vn/recipe/g1/5735/s400x400/recipe5735-636021874347899856.jpg")
Collection.create(user: User.first, name: "các món ngon biến tấu cùng dưa hấu",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
  remote_cover_url: "https://media.cooky.vn/recipe/g2/11310/s400x400/recipe11310-635809333048489088.jpg")
Collection.create(user: User.second, name: "thịt chó 7 món",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
  remote_cover_url: "https://media.cooky.vn/recipe/g1/1033/s400x400/recipe1033-635554421530785577.jpg")
Collection.create(user: User.second, name: "những món ngon từ há cảo - sủi cảo",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
  remote_cover_url: "https://media.cooky.vn/recipe/g2/14665/s400x400/recipe14665-635618402611489534.jpg")
Collection.create(user: User.second, name: "món ăn nhanh dễ làm",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
  remote_cover_url: "https://media.cooky.vn/recipe/g1/1211/s400x400/recipe1211-635568429332458504.jpg")
Collection.create(user: User.second, name: "Danh sách các món ngon từ cánh gà",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
  remote_cover_url: "https://media.cooky.vn/recipe/g2/18230/s400x400/cooky-recipe-636114352782603712.jpg")

Collection.all.each do |collection|
  Recipe.all.each do |recipe|
    collection.collections_recipes.create recipe: recipe
  end
end

