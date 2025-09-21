class DrinkModel {
  final String image;
  final String name;
  final int prix;
  DrinkModel({required this.image, required this.name, required this.prix});

  static List<DrinkModel> drinksList = [
    DrinkModel(
      image: "assets/drinks/Salted Caramel.png",
      name: "Salted Caramel",
      prix: 24,
    ),
    DrinkModel(
      image: "assets/drinks/ice_latte__milkshake.png",
      name: "ice latte milkshake",
      prix: 17,
    ),

    // DrinkModel(
    //     image:
    //         "assets/drinks/cappuccino_coffee_with_whipped_cream_and_chocolate.png",
    //     name: "cappuccino coffee",
    //     prix: 29),
    DrinkModel(
      image: "assets/drinks/vanilla_milkshake.png",
      name: "vanilla milkshake",
      prix: 28,
    ),
    DrinkModel(
      image: "assets/drinks/Peanut Butter.png",
      name: "Peanut Butter",
      prix: 14,
    ),
    DrinkModel(
      image: "assets/drinks/Strawberry.png",
      name: "Strawberry milkshake",
      prix: 14,
    ),
    DrinkModel(
      image: "assets/drinks/chocolate_milkshake_smoothie_dessert_drink.png",
      name: "Chocolate milkshake",
      prix: 20,
    ),
    DrinkModel(
      image: "assets/drinks/Chocolate_frappuccino.png",
      name: "Chocolate frappuccino",
      prix: 23,
    ),
    DrinkModel(
      image: "assets/drinks/Brownie Island.png",
      name: "Brownie Island",
      prix: 21,
    ),
  ];
}
