import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Low Stock Alert',
      'message': 'Product SKU-12345 stock is below minimum level',
      'timestamp': '2 hours ago',
      'type': 'warning',
      'icon': Icons.warning,
      'color': Colors.orange,
      'isRead': false,
    },
    {
      'title': 'Transfer Completed',
      'message': '50 units transferred from Warehouse A to Warehouse B',
      'timestamp': '5 hours ago',
      'type': 'info',
      'icon': Icons.info,
      'color': Colors.blue,
      'isRead': false,
    },
    {
      'title': 'Stock Received',
      'message': '100 units of SKU-67890 received from supplier',
      'timestamp': '1 day ago',
      'type': 'success',
      'icon': Icons.check_circle,
      'color': Colors.green,
      'isRead': true,
    },
    {
      'title': 'System Maintenance',
      'message': 'System maintenance scheduled for tonight',
      'timestamp': '2 days ago',
      'type': 'info',
      'icon': Icons.info,
      'color': Colors.blue,
      'isRead': true,
    },
    {
      'title': 'Order Alert',
      'message': 'Order #ORD-2024-001 is ready for pickup',
      'timestamp': '3 days ago',
      'type': 'success',
      'icon': Icons.check_circle,
      'color': Colors.green,
      'isRead': true,
    },
  ];

  void _markAsRead(int index) {
    setState(() {
      notifications[index]['isRead'] = true;
    });
  }

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  void _clearAll() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Notifications?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                notifications.clear();
              });
              Navigator.pop(context);
            },
            child: const Text('Clear All', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  int get unreadCount => notifications.where((n) => !n['isRead']).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.amberAccent.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${unreadCount} unread',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                if (notifications.isNotEmpty)
                  TextButton(
                    onPressed: _clearAll,
                    child: const Text(
                      'Clear All',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),

          // Notifications List
          Expanded(
            child: notifications.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No notifications',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: notification['isRead']
                              ? Colors.grey[100]
                              : Colors.amberAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: notification['color'].withOpacity(0.3),
                          ),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: notification['color'].withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              notification['icon'],
                              color: notification['color'],
                            ),
                          ),
                          title: Text(
                            notification['title'],
                            style: TextStyle(
                              fontWeight: notification['isRead']
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(notification['message']),
                              const SizedBox(height: 8),
                              Text(
                                notification['timestamp'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton<String>(
                            onSelected: (String result) {
                              if (result == 'read') {
                                _markAsRead(index);
                              } else if (result == 'delete') {
                                _deleteNotification(index);
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  if (!notification['isRead'])
                                    const PopupMenuItem<String>(
                                      value: 'read',
                                      child: Text('Mark as Read'),
                                    ),
                                  const PopupMenuItem<String>(
                                    value: 'delete',
                                    child: Text('Delete'),
                                  ),
                                ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
