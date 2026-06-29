class NotificationModel {
  final int id;
  final int userId;
  final String title;
  final String message;
  final String type;
  final bool isRead;
  final String createdAt;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
  });
}

final List<NotificationModel> mockNotifications = [
  NotificationModel(
    id: 1,
    userId: 1,
    title: "System Update",
    message: "System maintenance scheduled tonight.",
    type: "info",
    isRead: false,
    createdAt: "2026-06-26",
  ),
  NotificationModel(
    id: 2,
    userId: 2,
    title: "Asset Assigned",
    message: "Laptop has been assigned to you.",
    type: "success",
    isRead: true,
    createdAt: "2026-06-25",
  ),
];