user_admin = User.create(
  email: "megan.a.salisbury+admin@gmail.com",
  password: "megaderp",
  role: "admin"
)

tester = User.create(
  email: "megan.a.salisbury+tester@gmail.com",
  password: "megaderp"
)

Profile.create(
  username: "Admin",
  location: "Boston, MA",
  user: user_admin
)

Profile.create(
  username: "Tester",
  location: "Boston, MA",
  user: tester
)

recipe = Recipe.create(
  user: tester,
  name: "Nice IPA",
  beer_type: "IPA",
  description: "Very tasty."
)

ing1 = Ingredient.create(
  recipe: recipe,
  user: tester,
  unit: "LBS",
  quantity: 2,
  item: "Chocolate Roast Malt"
)

ing2 = Ingredient.create(
  recipe: recipe,
  user: tester,
  unit: "PACKAGE",
  quantity: 1,
  item: "WYEAST Lager Yeast"
)

Instruction.create(
  recipe: recipe,
  user: tester,
  ingredient: ing1,
  unit: "LBS",
  quantity: 1,
  add_point: "60",
  temperature: "160F"
)

Instruction.create(
  recipe: recipe,
  user: tester,
  ingredient: ing2,
  unit: "PACKAGE",
  quantity: 1,
  add_point: "0",
  temperature: "70F"
)

recipe2 = Recipe.create(
  user: tester,
  name: "Tasty Belgian",
  beer_type: "Hefeweizen",
  description: "Very wheaty."
)

comment = Comment.create(
  user: tester,
  recipe: recipe,
  body: "So good, very hoppy."
)

comment = Comment.create(
  user: tester,
  recipe: recipe2,
  body: "Came out alright, needs more Cascadia hops."
)
