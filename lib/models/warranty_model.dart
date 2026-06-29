class WarrantyModel {
  final int id;
  final int inventoryItemId;
  final String warrantyProvider;
  final String warrantyStart;
  final String warrantyEnd;
  final String details;

  WarrantyModel({
    required this.id,
    required this.inventoryItemId,
    required this.warrantyProvider,
    required this.warrantyStart,
    required this.warrantyEnd,
    required this.details,
  });
}

final List<WarrantyModel> mockWarranties = [
  WarrantyModel(
    id: 1,
    inventoryItemId: 1,
    warrantyProvider: "Dell Services",
    warrantyStart: "2026-01-01",
    warrantyEnd: "2028-01-01",
    details: "Full coverage warranty",
  ),
  WarrantyModel(
    id: 2,
    inventoryItemId: 2,
    warrantyProvider: "HP Care",
    warrantyStart: "2026-02-01",
    warrantyEnd: "2027-02-01",
    details: "Standard warranty",
  ),
];