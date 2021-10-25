import 'dart:convert';
class PaymentMethod {
    PaymentMethod({
        this.paymentId,
        this.description
    });

    int? paymentId;
    String? description;
    

    factory PaymentMethod.fromRawJson(String str) => PaymentMethod.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        paymentId: json["paymentId"],
        description: json["description"]
    );

    Map<String, dynamic> toJson() => {
        "paymentId": paymentId,
        "description": description
    };
}