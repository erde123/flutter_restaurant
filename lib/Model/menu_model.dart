class ModelMenu {
  String name;
  String description;
  double price;
  String category;
  double rating;
  String image;

  ModelMenu({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
    required this.image,
  });

  factory ModelMenu.fromJson(Map<String, dynamic> json) => ModelMenu(
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        category: json["category"],
        rating: json["rating"]?.toDouble(),
        image: json["image"],
      );
}
