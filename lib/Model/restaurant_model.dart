class ModelRestaurant {
    String id;
    String nama;
    String location;
    List<String> category;
    String image;

    ModelRestaurant({
        required this.id,
        required this.nama,
        required this.location,
        required this.category,
        required this.image,
    });

    factory ModelRestaurant.fromJson(Map<String, dynamic> json) => ModelRestaurant(
        id: json["id"],
        nama: json["nama"],
        location: json["location"],
        category: List<String>.from(json["category"].map((x) => x)),
        image: json["image"],
    );
}