class CreateOrder {
  final String shop_name;
  final String  received_address;
  final String  invoice;

  CreateOrder({required this.shop_name, required this.received_address, required this.invoice});
   

    Map<String, dynamic> toJson() {
    return {
      'shop_name': shop_name,
      'received_address': received_address,
      'invoice': invoice,
    };
  }

}
