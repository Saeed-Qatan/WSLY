class AssignedOrdersModel {
  final int id;
  final String storeName;
  final String ownerName;
  final DateTime deliveryTime;
  final String orderCode;
  final String imageUrl;
  final bool isDelivered;

  AssignedOrdersModel({
    required this.id,
    required this.storeName,
    required this.ownerName,
    required this.deliveryTime,
    required this.orderCode,
    required this.imageUrl,
    required this.isDelivered,
  });

  // CopyWith method for immutability
  AssignedOrdersModel copyWith({
    int? id,
    String? storeName,
    String? ownerName,
    DateTime? deliveryTime,
    String? orderCode,
    String? imageUrl,
    bool? isDelivered,
  }) {
    return AssignedOrdersModel(
      id: id ?? this.id,
      storeName: storeName ?? this.storeName,
      ownerName: ownerName ?? this.ownerName,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      orderCode: orderCode ?? this.orderCode,
      imageUrl: imageUrl ?? this.imageUrl,
      isDelivered: isDelivered ?? this.isDelivered,
    );
  }

  // Method to convert from a JSON object (useful when fetching data from an API)
  factory AssignedOrdersModel.fromJson(Map<String, dynamic> json) {
    return AssignedOrdersModel(
      id: json['id'],
      storeName: json['storeName'],
      ownerName: json['ownerName'],
      deliveryTime: DateTime.parse(json['deliveryTime']),
      orderCode: json['orderCode'],
      imageUrl: json['imageUrl'],
      isDelivered: json['isDelivered'],
    );
  }

  // Method to convert an instance of the model to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storeName': storeName,
      'ownerName': ownerName,
      'deliveryTime': deliveryTime.toIso8601String(),
      'orderCode': orderCode,
      'imageUrl': imageUrl,
      'isDelivered': isDelivered,
    };
  }
}
