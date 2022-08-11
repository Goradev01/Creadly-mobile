class MerchantData {
  bool? isApproved;
  String? id;
  String? shopName;
  String? phoneNumber;
  String? email;
  bool? isActive;
  bool? isVerified;
  String? password;
  String? createdAt;
  int? v;
  String? profilePicture;
  String? address;
  String? cacDocument;
  String? location;
  String? accountName;
  String? accountNumber;
  String? bank;
  String? bvn;

  MerchantData({
    required this.isApproved,
    required this.id,
    required this.shopName,
    required this.phoneNumber,
    required this.email,
    required this.isActive,
    required this.isVerified,
    required this.password,
    required this.createdAt,
    required this.v,
    required this.profilePicture,
    required this.address,
    required this.cacDocument,
    required this.location,
    required this.accountName,
    required this.accountNumber,
    required this.bank,
    required this.bvn,
  });
  MerchantData.fromJson(Map<String, dynamic> map) {
    isApproved = map['isApproved'];
    id = map['_id'];
    shopName = map['shopName'];
    phoneNumber = map['phoneNumber'];
    email = map['email'];
    isActive = map['isActive'];
    isVerified = map['isVerified'];
    password = map['password'];
    createdAt = map['createdAt'];
    v = map['__v'];
    profilePicture = map['profilePicture'];
    address = map['address'];
    cacDocument = map['cacDocument'];
    location = map['location'];
    accountName = map['accountName'];
    accountNumber = map['accountNumber'];
    bank = map['bank'];
    bvn = map['bvn'];
  }
  Map<String, dynamic> toJson() => {
        'isApproved': isApproved,
        'id': id,
        'shopName': shopName,
        'phoneNumber': phoneNumber,
        'email': email,
        'isActive': isActive,
        'isVerified': isVerified,
        'password': password,
        'createdAt': createdAt,
        'v': v,
        'profilePicture': profilePicture,
        'address': address,
        'cacDocument': cacDocument,
        'location': location,
        'accountName': accountName,
        'accountNumber': accountNumber,
        'bank': bank,
        'bvn': bvn,
      };
}
