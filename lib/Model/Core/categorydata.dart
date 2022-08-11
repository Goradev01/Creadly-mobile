class CategoryData {
  String? id;
  String? name;
  String? imageUrl;
  bool? isActive;
  int? v;

  CategoryData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isActive,
    required this.v,
  });

  CategoryData.fromJson(Map<String, dynamic> map) {
    id = map['_id'];
    name = map['name'];
    imageUrl = map['imageUrl'];
    isActive = map['isActive'];
    v = map['__v'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        "imageUrl": imageUrl,
        'isActive': isActive,
        'v': v
      };
  //   CategoryData.fromJson(Map<String, dynamic> map) {
  //   return CategoryData(
  //       id: map['_id'],
  //       name: map['name'],
  //       imageUrl: map['ImageUrl'],
  //       isActive: map['isActive'],
  //       v: map['__v']);
  // }

}
