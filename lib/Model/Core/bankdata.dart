class BankAccount {
  String? accountNumber;
  String? bank;
  String? bankCode;
  String? accountName;
  bool? isDefault;
  String? id;
  BankAccount({
    required this.accountNumber,
    required this.bank,
    required this.bankCode,
    required this.accountName,
    required this.isDefault,
    required this.id,
  });
  BankAccount.fromJson(Map<String, dynamic> map) {
    accountNumber = map["accountNumber"];
    bank = map["bank"];
    bankCode = map["bankCode"];

    isDefault = map['isDefault'];
    id = map["_id"];
  }
  Map<String, dynamic> toJson() => {
        'accountNumber': accountNumber,
        'bank': bank,
        'bankCode': bankCode,
        'accountName': accountName,
        'isDefault': isDefault,
        'id': id,
      };
}
