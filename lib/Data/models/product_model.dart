class Product {
  int proId;
  String title;
  double price;
  String description;
  String category;
  String image;
  double rate;
  int count;

  Product.fromJson(Map<String, dynamic> json) {
    proId = json["id"];
    title = json["title"];
    price = double.parse('${json["price"]}');
    description = json["description"];
    category = json["category"];
    image = json["image"];
    rate = double.parse('${json["rating"]["rate"]}');
    count = json["rating"]["count"];
  }
}
