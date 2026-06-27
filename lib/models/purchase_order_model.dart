class PurchaseOrderModel {
  final int id;
  final String poNumber;
  final String supplier;
  final double totalAmount;
  final String orderDate;
  final String expectedDelivery;
  final String status;

  PurchaseOrderModel({
    required this.id,
    required this.poNumber,
    required this.supplier,
    required this.totalAmount,
    required this.orderDate,
    required this.expectedDelivery,
    required this.status,
  });
}

final List<PurchaseOrderModel> mockPurchaseOrders = [
  PurchaseOrderModel(
    id: 1,
    poNumber: "PO-001",
    supplier: "Tech Solutions Ltd",
    totalAmount: 5000,
    orderDate: "2026-06-01",
    expectedDelivery: "2026-06-10",
    status: "Pending",
  ),
  PurchaseOrderModel(
    id: 2,
    poNumber: "PO-002",
    supplier: "ABC Electronics",
    totalAmount: 3200,
    orderDate: "2026-06-05",
    expectedDelivery: "2026-06-12",
    status: "Delivered",
  ),
];