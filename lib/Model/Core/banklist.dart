class BankList {
  String? name;
  int? id;

  BankList({
    required this.id,
    required this.name,
  });
  BankList.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
