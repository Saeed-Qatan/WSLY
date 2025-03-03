enum OrderStatus { deliverd, inProgress, canceled }

class OrderRegistryModel {
  
  final String storeName;
  final String ownerName;
  final double deliveryTime;
  final OrderStatus status;
  final String imageUrl;

  OrderRegistryModel({
    
    required this.storeName,
    required this.ownerName,
    required this.deliveryTime,
    required this.status,
    required this.imageUrl,
  });

  // للتحويل من json الى list [OrderModel]
  factory OrderRegistryModel.fromJson(Map<String, dynamic> json) {
    return OrderRegistryModel(
      
      storeName: json["storeName"],
      ownerName: json["ownerName"],
      deliveryTime: json["deliveryTime"],
      status: _getStatuesFromString(json["status"]),
      imageUrl: json["imageUrl"],
    );
  }
  //to send by api
  Map<String, dynamic> toJson() {
    return {
      
      'stor_eName': storeName,
      'owner_Name': ownerName,
      'delivery_Time': deliveryTime,
    'status': _getStatusAsString(status),
      'imageUrl': imageUrl,
    };
  }

  //transformation the Strig to enum

  static OrderStatus _getStatuesFromString(String status) {
    switch (status.toLowerCase()) {
      case "تم التوصيل":
        return OrderStatus.deliverd;

      case "جاري التوصيل ":
        return OrderStatus.inProgress;

      case "تم الإلغاء":
        return OrderStatus.canceled;
      default:
        throw Exception("حالة الطلب غير موجودة:$status");
    }
  }

  static String _getStatusAsString(OrderStatus status) {
    switch (status) {
      case OrderStatus.deliverd:
        return "نم التوصيل";

        case OrderStatus.inProgress:
        return"جاري التوصيل";

        case OrderStatus.canceled:
        return "نم الإلغاء";
    }
  }
}
