class UserData {
  bool? isIDVerified;
  bool? isSelfieVerified;
  List? wishlist;
  String? id;
  String? phoneNumber;
  String? email;
  bool? isAdmin;
  bool? isSuperAdmin;
  bool? isActive;
  bool? isVerified;
  String? password;
  String? createdAt;
  int? v;
  dynamic firstName;
  dynamic address;
  dynamic bvn;
  dynamic dateOfBirth;
  dynamic companyCode;

  dynamic lastName;
  List? cart;

  UserData({
    required this.isIDVerified,
    required this.isSelfieVerified,
    required this.wishlist,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.isAdmin,
    required this.isSuperAdmin,
    required this.isActive,
    required this.isVerified,
    required this.password,
    required this.createdAt,
    required this.v,
    required this.address,
    required this.bvn,
    required this.dateOfBirth,
    required this.companyCode,
    required this.cart,
  });
  UserData.fromJson(Map<String, dynamic> map) {
    isIDVerified = map['isIDVerified'];
    isSelfieVerified = map['isSelfieVerified'];
    wishlist = map['wishlist'];
    id = map['_id'];
    phoneNumber = map['phoneNumber'];
    email = map['email'];
    isAdmin = map['isAdmin'];
    isSuperAdmin = map['isSuperAdmin'];
    isActive = map['isActive'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    isVerified = map['isVerified'];
    password = map['password'];
    createdAt = map['createdAt'];
    v = map['_v'];
    companyCode = map['companyCode'];
    v = map['_v'];
    cart = map['cart'];
    address = map['address'];
    bvn = map['bvn'];
    dateOfBirth = map['dateOfBirth'];
  }
  Map<String, dynamic> toJson() => {
        'isIDVerified': isIDVerified,
        'isSelfieVerified': isSelfieVerified,
        'wishlist': wishlist,
        'id': id,
        'phoneNumber': phoneNumber,
        'email': email,
        'isAdmin': isAdmin,
        'isSuperAdmin': isSuperAdmin,
        'isActive': isActive,
        'firstName': firstName,
        'lastName': lastName,
        'isVerified': isVerified,
        'password': password,
        'createdAt': createdAt,
        'v': v,
        'cart': cart,
        'address': address,
        'bvn': bvn,
        'dateOfBirth': dateOfBirth,
        'companyCode': companyCode,
      };
}
