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
  ingredients: "Rye, 1/4 pound. Barley, 1/2 pound.",
  brewing_instructions: "Put loose grain into muslin bag.",
  description: "Very tasty."
)

recipe2 = Recipe.create(
  user: tester,
  name: "Tasty Belgian",
  beer_type: "Hefeweizen",
  ingredients: "Cardamom, orange peel, coriander.",
  brewing_instructions: "Steep the peel, coriander, and cardamom in a muslin bag in the wort.",
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
