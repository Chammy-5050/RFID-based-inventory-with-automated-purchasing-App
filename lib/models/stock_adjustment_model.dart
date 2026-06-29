
class StockAdjustmentModel {
  final int id;
  final int inventoryItemId;
  final String adjustmentType;
  final int quantity;
  final String reason;
  final int adjustedBy;

  StockAdjustmentModel({
    required this.id,
    required this.inventoryItemId,
    required this.adjustmentType,
    required this.quantity,
    required this.reason,
    required this.adjustedBy,
  });
}

final List<StockAdjustmentModel> mockStockAdjustments = [
  StockAdjustmentModel(
    id: 1,
    inventoryItemId: 1,
    adjustmentType: "increase",
    quantity: 5,
    reason: "New stock added",
    adjustedBy: 1,
  ),
  StockAdjustmentModel(
    id: 2,
    inventoryItemId: 2,
    adjustmentType: "decrease",
    quantity: 1,
    reason: "Damaged item removed",
    adjustedBy: 2,
  ),
];