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
  name: "Salisbury Knoll Rye IPA",
  beer_type: "IPA",
  description: "Like v1 but richer malt (hence all munich rather than mostly light malt extract) and more pronounced flavor/nose on the hops."
)

ing1 = Ingredient.create(
  recipe: recipe,
  user: tester,
  unit: "OZ",
  quantity: 4,
  item: "10| Crystal Malt"
)

ing2 = Ingredient.create(
  recipe: recipe,
  user: tester,
  unit: "LBS",
  quantity: 7.7,
  item: "Munich Malt Extract"
)

ing3 = Ingredient.create(
  recipe: recipe,
  user: tester,
  unit: "OZ",
  quantity: 2,
  item: "Centennial Hops"
)

ing4 = Ingredient.create(
  recipe: recipe,
  user: tester,
  unit: "OZ",
  quantity: 4,
  item: "Cascade Hops"
)

Instruction.create(
  recipe: recipe,
  user: tester,
  ingredient: ing1,
  unit: "OZ",
  quantity: 4,
  add_point: 30,
  temperature: "150-170F"
)

Instruction.create(
  recipe: recipe,
  user: tester,
  ingredient: ing2,
  unit: "LBS",
  quantity: 7.7,
  add_point: 60,
  temperature: "Boil"
)

Instruction.create(
  recipe: recipe,
  user: tester,
  ingredient: ing3,
  unit: "OZ",
  quantity: 1,
  add_point: 10,
  temperature: "Boil"
)

Instruction.create(
  recipe: recipe,
  user: tester,
  ingredient: ing4,
  unit: "OZ",
  quantity: 1,
  add_point: 10,
  temperature: "Boil"
)

Instruction.create(
  recipe: recipe,
  user: tester,
  ingredient: ing4,
  unit: "OZ",
  quantity: 0.5,
  add_point: 1,
  temperature: "Boil"
)

comment = Comment.create(
  user: tester,
  recipe: recipe,
  body: "Online calculator reports this should be ~82 IBUs. Increasing boil volume to 5 gallons would yield 200 IBUs."
)

batch = Batch.create(
  bottling_option: "22OZ",
  recipe: recipe,
  user: tester,
  bottle_count: 25,
  bottle_brewed: 25,
  batch_name: "March Madness",
  batch_notes: "Didn't strain out boil hops when pouring into fermenter bucket. Fermentation notes: 14 days in primary, fermentation happened fast, basically done  after 2 days. Added cascade after 3 days, citra after 7. Bottling notes, ~4.3 gal into bottling bucket, lots of trub (should have filtered hops after boil)"
)

recipe2 = Recipe.create(
user: tester,
name: "Salisbury Knoll eXtra Bitter Special Bitter",
beer_type: "Bitter",
description: "Like a classic english bitter, but with the hops turned up a notch. Has everything I like in a Pub style Bitter (whitbred XXX, Boddingtons, Fullers etc) but with a slightly hoppier character."
)
