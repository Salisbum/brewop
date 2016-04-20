megan = User.create(
  email: "megan.a.salisbury@gmail.com",
  password: "megaderp"
)

tester = User.create(
email: "megan.a.salisbury+tester@gmail.com",
password: "megaderp"
)

recipe = Recipe.create(
  user: megan,
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
  user: megan,
  recipe: recipe,
  body: "So good, very hoppy."
)

comment = Comment.create(
  user: tester,
  recipe: recipe2,
  body: "Came out alright, needs more Cascadia hops."
)
