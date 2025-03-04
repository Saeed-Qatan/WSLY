class CurrentOrdersModel {
  final String storeName;
  final String ownerName;
  final double deliveryTime;
  final int order_code;
  final String imageUrl;

  CurrentOrdersModel({
    required this.storeName,
    required this.ownerName,
    required this.deliveryTime,
    required this.order_code,
    required this.imageUrl,
  });


  factory CurrentOrdersModel.fromJson(Map<String, dynamic> json) {
    return CurrentOrdersModel(
      storeName: json["storeName"],
      ownerName: json["ownerName"],
      deliveryTime: json["deliveryTime"],
      order_code: json["order_code"],
      imageUrl: json["order_code"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'stor_eName': storeName,
      'owner_Name': ownerName,
      'delivery_Time': deliveryTime,
      'order_code': order_code,
      'imageUrl': imageUrl,
    };
  }
}
