class OrderData {
  String? id;
  List? items;
  int? orderId;
  int? orderNo;
  int? amountPaid;
  int? totalDeliveryFee;
  String? paymentMethod;
  int? v;
  String? createdAt;
  bool? isPaid;
  bool? isCompleted;
  Map? userId;
  OrderData({
    required this.id,
    required this.items,
    required this.orderId,
    required this.orderNo,
    required this.amountPaid,
    required this.totalDeliveryFee,
    required this.paymentMethod,
    required this.v,
    required this.createdAt,
    required this.isPaid,
    required this.isCompleted,
    required this.userId,
  });
  OrderData.fromJson(Map<String, dynamic> map) {
    id = map['_id'];
    items = map['items'];
    orderId = map['orderId'];
    orderNo = map['orderNo'];
    amountPaid = map['amountPaid'];
    totalDeliveryFee = map['totalDeliveryFee'];
    paymentMethod = map['paymentMethod'];
    v = map['__v'];
    createdAt = map['createdAt'];
    isPaid = map['isPaid'];
    isCompleted = map['isCompleted'];
    userId = map['userId'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'items': items,
        'orderId': orderId,
        'orderNo': orderNo,
        'amountPaid': amountPaid,
        'totalDeliveryFee': totalDeliveryFee,
        'paymentMethod': paymentMethod,
        'v': v,
        'createdAt': createdAt,
        'isPaid': isPaid,
        'isCompleted': isCompleted,
        'userId': userId,
      };
}
