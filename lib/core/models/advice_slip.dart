import 'slip.dart';

class AdviceSlip {
  Slip? slip;

  AdviceSlip({this.slip});

  AdviceSlip.fromJson(Map<String, dynamic> json) {
    slip = json['slip'] != null ? Slip.fromJson(json['slip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (slip != null) {
      data['slip'] = slip?.toJson();
    }
    return data;
  }
}
