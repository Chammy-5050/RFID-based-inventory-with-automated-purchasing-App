class ActivityLogModel {
  final int id;
  final int userId;
  final String action;
  final String description;
  final String ipAddress;
  final String createdAt;

  ActivityLogModel({
    required this.id,
    required this.userId,
    required this.action,
    required this.description,
    required this.ipAddress,
    required this.createdAt,
  });
}

final List<ActivityLogModel> mockActivityLogs = [
  ActivityLogModel(
    id: 1,
    userId: 1,
    action: "LOGIN",
    description: "User logged in",
    ipAddress: "192.168.1.5",
    createdAt: "2026-06-27 08:10",
  ),
  ActivityLogModel(
    id: 2,
    userId: 2,
    action: "UPDATE",
    description: "Updated inventory item",
    ipAddress: "192.168.1.6",
    createdAt: "2026-06-27 08:30",
  ),
];