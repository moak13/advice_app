class Slip {
  String? slipId;
  String? advice;

  Slip({this.slipId, this.advice});

  Slip.fromJson(Map<String, dynamic> json) {
    slipId = json['slip_id'];
    advice = json['advice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slip_id'] = slipId;
    data['advice'] = advice;
    return data;
  }
}
