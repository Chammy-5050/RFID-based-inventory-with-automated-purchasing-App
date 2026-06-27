
class InventoryItemModel {
  final int id;
  final String tagId;
  final String assetCode;
  final String itemName;
  final String category;
  final String description;
  final String purchaseDate;
  final double purchaseCost;
  final String supplier;
  final int locationId;
  final int assignedUserId;
  final String status;
  final String conditionStatus;
  final String image;

  InventoryItemModel({
    required this.id,
    required this.tagId,
    required this.assetCode,
    required this.itemName,
    required this.category,
    required this.description,
    required this.purchaseDate,
    required this.purchaseCost,
    required this.supplier,
    required this.locationId,
    required this.assignedUserId,
    required this.status,
    required this.conditionStatus,
    required this.image,
  });
}

final List<InventoryItemModel> mockInventoryItems = [
  InventoryItemModel(
    id: 1,
    tagId: "RFID0001",
    assetCode: "AST-001",
    itemName: "Dell Latitude 7420",
    category: "Laptop",
    description: "Core i7, 16GB RAM, 512GB SSD",
    purchaseDate: "2026-01-12",
    purchaseCost: 1800,
    supplier: "Tech Solutions Ltd",
    locationId: 1,
    assignedUserId: 2,
    status: "Available",
    conditionStatus: "Excellent",
    image: "assets/images/laptop.png",
  ),
  InventoryItemModel(
    id: 2,
    tagId: "RFID0002",
    assetCode: "AST-002",
    itemName: "HP ProBook",
    category: "Laptop",
    description: "Core i5, 8GB RAM",
    purchaseDate: "2026-02-10",
    purchaseCost: 1200,
    supplier: "ABC Electronics",
    locationId: 2,
    assignedUserId: 3,
    status: "Assigned",
    conditionStatus: "Good",
    image: "assets/images/laptop2.png",
  ),
];