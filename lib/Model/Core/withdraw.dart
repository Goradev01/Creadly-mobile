class WithdrawData {
  Map? account;
  // bool? isOTPProvided;
  String? id;
  // String? type;
  int? status;
  int? amount;
  // bool? isPaid;
  // bool? isRejected;
  // bool? isApproved;
  // bool? isApprovedByAdmin;
  // String? userId;
  // String? companyId;
  // String? staffId;
  // String? createdAt;
  // String? updatedAt;
  // String? v;
  WithdrawData({
    required this.account,
    // required this.isOTPProvided,
    required this.id,
    // required this.type,
    required this.status,
    required this.amount,
    // required this.isPaid,
    // required this.isRejected,
    // required this.isApproved,
    // required this.isApprovedByAdmin,
    // required this.userId,
    // required this.companyId,
    // required this.staffId,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.v,
  });
  WithdrawData.fromJson(Map<String, dynamic> map) {
    account = map['account'];
    // // isOTPProvided = map['isOTPProvided'];
    id = map['_id'];
    // // type = map['type'];
    status = map['status'];
    amount = map['amount'];
    // // isPaid = map['isPaid'];
    // // isRejected = map['isRejected'];
    // isApproved = map['isApproved'];
    // isApprovedByAdmin = map['isApprovedByAdmin'];
    // // userId = map['userId'];
    // // companyId = map['companyId'];
    // // staffId = map['staffId'];
    // // createdAt = map['createdAt'];
    // // updatedAt = map['updatedAt'];
    // // v = map['__v'];
  }

  Map<String, dynamic> toJson() => {
        'account': account,
        // // 'isOTPProvided': isOTPProvided,
        'id': id,
        // // 'type': type,
        'status': status,
        'amount': amount,
        // // 'isPaid': isPaid,
        // // 'isRejected': isRejected,
        // 'isApproved': isApproved,
        // 'isApprovedByAdmin': isApprovedByAdmin,
        // // 'userId': userId,
        // // 'companyId': companyId,
        // // 'staffId': staffId,
        // // 'createdAt': createdAt,
        // // 'updatedAt': updatedAt,
        // // 'v': v,
      };
}
