class ProductModel {
  final int id;
  final dynamic price;
  final String title;
  final String description;
  final String category;
  final String image;
  final RatingModel? ratingModel;
  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    this.ratingModel,
  });
  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
        id: json['id'],
        price: json['price'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        ratingModel: RatingModel.fromJson(json['rating']));
  }
  factory ProductModel.fromJsonToUpdateProduct(dynamic json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}

class RatingModel {
  final num rate;
  final num count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(dynamic json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }
}
