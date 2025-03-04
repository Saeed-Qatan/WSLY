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

  static List<CurrentOrdersModel> getCurrentorder() {
    List<CurrentOrdersModel> currentOrders = [
  (CurrentOrdersModel(storeName: "Store 1", ownerName: "Owner 1", deliveryTime: 30.0, order_code: 1001, imageUrl: "url1")),
  (CurrentOrdersModel(storeName: "Store 2", ownerName: "Owner 2", deliveryTime: 45.0, order_code: 1002, imageUrl: "url2")),
  (CurrentOrdersModel(storeName: "Store 3", ownerName: "Owner 3", deliveryTime: 25.0, order_code: 1003, imageUrl: "url3")),
  (CurrentOrdersModel(storeName: "Store 4", ownerName: "Owner 4", deliveryTime: 50.0, order_code: 1004, imageUrl: "url4")),
    ];
    
    return currentOrders;
  }

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
