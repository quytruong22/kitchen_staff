class CheckdetailCheck {
  final int detailid;
  final int checkid;

  CheckdetailCheck({required this.checkid, required this.detailid});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['checkid'] = checkid;
    data['detailid'] = detailid;
    return data;
  }
}
