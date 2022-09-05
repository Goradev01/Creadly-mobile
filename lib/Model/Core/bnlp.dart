class BnplData {
  dynamic data;

  BnplData({
    required this.data,
  });

  BnplData.fromJson(Map<String, dynamic> map) {
    data = map['data'];
  }
  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
