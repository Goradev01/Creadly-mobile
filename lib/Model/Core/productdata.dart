class ProductData {
  String? createdAt;
  String? id;
  String? image;
  List? pictures;
  String? name;
  String? description;
  String? merchant;
  String? category;
  int? quantity;
  int? price;
  bool? isActive;
  bool? isApproved;
  List? variants;
  int? v;
  ProductData({
    required this.createdAt,
    required this.id,
    required this.image,
    required this.pictures,
    required this.name,
    required this.description,
    required this.merchant,
    required this.category,
    required this.quantity,
    required this.price,
    required this.isActive,
    required this.isApproved,
    required this.variants,
    required this.v,
  });
  ProductData.fromJson(Map<String, dynamic> map) {
    createdAt = map['createdAt'];
    id = map['_id'];
    image = map['image'];
    pictures = map['pictures'];
    name = map['name'];
    description = map['description'];
    merchant = map['merchant'];
    category = map['category'];
    quantity = map['quantity'];
    price = map['price'];
    isActive = map['isActive'];

    isApproved = map['isApproved'];
    variants = map['variants'];
    v = map['__v'];
  }
  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'id': id,
        'image': image,
        'pictures': pictures,
        'name': name,
        'description': description,
        'merchant': merchant,
        'category': category,
        'quantity': quantity,
        'price': price,
        'isActive': isActive,
        'isApproved': isApproved,
        'variants': variants,
        'v': v,
      };
}
