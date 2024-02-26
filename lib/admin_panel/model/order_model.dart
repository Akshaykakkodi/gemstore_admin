class OrderModel {
  String orderId;
  String orderDate;
  String trackingNumber;
  String quantity;
  String subTotal;
  String status;
  OrderModel(
      {required this.orderId,
      required this.trackingNumber,
      required this.orderDate,
      required this.quantity,
      required this.status,
      required this.subTotal});
}
