user_admin = User.create(
  email: "megan.a.salisbury+admin@gmail.com",
  password: "megaderp",
  role: "admin"
)

Profile.create(
  username: "Admin",
  location: "Boston, MA",
  avatar_url: "https://i.ytimg.com/vi/sUOifHlxGiw/hqdefault.jpg",
  brewop_name: "Brewmin",
  user: user_admin
)

tester = User.create(
  email: "megan.a.salisbury+tester@gmail.com",
  password: "megaderp"
)

Profile.create(
  username: "Herpina",
  location: "NY, NY",
  avatar_url: "http://shewearsmanyhats.com/wp-content/uploads/2013/07/dipped-ice-cream-cones-7.jpg",
  brewop_name: "TestOp",
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
