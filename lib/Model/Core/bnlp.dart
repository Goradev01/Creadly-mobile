class BnplData {
  int? bnpl;
  int? salaryAdvance;
  int? onDemand;

  BnplData({
    required this.bnpl,
    required this.salaryAdvance,
    required this.onDemand,
  });

  BnplData.fromJson(Map<String, dynamic> map) {
    bnpl = map['bnpl'];
    salaryAdvance = map['salaryAdvance'];
    onDemand = map['onDemand'];
  }
  Map<String, dynamic> toJson() => {
        'bnpl': bnpl,
        'salaryAdvance': salaryAdvance,
        'OnDemand': onDemand,
      };
}
