class PromoterBankModel {
  List<Data>? data;
  String? message;
  int? status;

  PromoterBankModel({this.data, this.message, this.status});

  PromoterBankModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? bankId;
  String? bankLogo;
  String? bankName;

  Data({this.bankId, this.bankLogo, this.bankName});

  Data.fromJson(Map<String, dynamic> json) {
    bankId = json['bankId'];
    bankLogo = json['bankLogo'];
    bankName = json['bankName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankId'] = this.bankId;
    data['bankLogo'] = this.bankLogo;
    data['bankName'] = this.bankName;
    return data;
  }
}
