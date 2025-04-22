class FaqModel {
  List<Data>? data;
  String? message;
  int? status;

  FaqModel({this.data, this.message, this.status});

  FaqModel.fromJson(Map<String, dynamic> json) {
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
  int? faqId;
  String? faqQuestion;
  String? faqAnswer;
  int? displayOrder;

  Data({this.faqId, this.faqQuestion, this.faqAnswer, this.displayOrder});

  Data.fromJson(Map<String, dynamic> json) {
    faqId = json['faqId'];
    faqQuestion = json['faqQuestion'];
    faqAnswer = json['faqAnswer'];
    displayOrder = json['displayOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faqId'] = this.faqId;
    data['faqQuestion'] = this.faqQuestion;
    data['faqAnswer'] = this.faqAnswer;
    data['displayOrder'] = this.displayOrder;
    return data;
  }
}
