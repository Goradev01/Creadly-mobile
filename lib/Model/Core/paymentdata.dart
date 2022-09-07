class PaymentData {
  String? id;
  String? amount;
  String? paymentMethod;
  String? reference;
  String? userId;
  String? orderId;
  String? createdAt;
  String? v;

  PaymentData({
    required this.id,
    required this.amount,
    required this.paymentMethod,
    required this.reference,
    required this.userId,
    required this.orderId,
    required this.createdAt,
    required this.v,
  });
  PaymentData.fromJson(Map<String, dynamic> map) {
    id = map['_id'];
    amount = map['amount'];
    paymentMethod = map['paymentMethod'];
    reference = map['reference'];
    userId = map['userId'];
    orderId = map['orderId'];
    createdAt = map['createdAt'];
    v = map['__v'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'paymentMethod': paymentMethod,
        'reference': reference,
        'userId': userId,
        'orderId': orderId,
        'createdAt': createdAt,
        'v': v,
      };
}
