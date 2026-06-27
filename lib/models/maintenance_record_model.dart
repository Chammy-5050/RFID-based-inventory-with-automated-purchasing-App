class MaintenanceRecordModel {
  final int id;
  final int inventoryItemId;
  final String maintenanceType;
  final String description;
  final String maintenanceDate;
  final String performedBy;
  final double cost;
  final String nextDueDate;

  MaintenanceRecordModel({
    required this.id,
    required this.inventoryItemId,
    required this.maintenanceType,
    required this.description,
    required this.maintenanceDate,
    required this.performedBy,
    required this.cost,
    required this.nextDueDate,
  });
}

final List<MaintenanceRecordModel> mockMaintenanceRecords = [
  MaintenanceRecordModel(
    id: 1,
    inventoryItemId: 1,
    maintenanceType: "Repair",
    description: "Replaced SSD drive",
    maintenanceDate: "2026-05-10",
    performedBy: "John Tech",
    cost: 120.0,
    nextDueDate: "2026-11-10",
  ),
  MaintenanceRecordModel(
    id: 2,
    inventoryItemId: 2,
    maintenanceType: "Checkup",
    description: "System diagnostics completed",
    maintenanceDate: "2026-06-01",
    performedBy: "IT Team",
    cost: 50.0,
    nextDueDate: "2026-12-01",
  ),
];