class AuditTrailModel {
  final int id;
  final int userId;
  final String tableName;
  final int recordId;
  final String operation;
  final String oldData;
  final String newData;
  final String createdAt;

  AuditTrailModel({
    required this.id,
    required this.userId,
    required this.tableName,
    required this.recordId,
    required this.operation,
    required this.oldData,
    required this.newData,
    required this.createdAt,
  });
}

final List<AuditTrailModel> mockAuditTrails = [
  AuditTrailModel(
    id: 1,
    userId: 1,
    tableName: "inventory_items",
    recordId: 10,
    operation: "UPDATE",
    oldData: "{status: available}",
    newData: "{status: assigned}",
    createdAt: "2026-06-27 07:50",
  ),
];