import 'package:flutter/material.dart';


class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() =>
      _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // CampusLink colors
  static const Color burgundy = Color(0xFF7A1F3D);
  static const Color darkBurgundy = Color(0xFF5C1730);
  static const Color beige = Color(0xFFF5EBDD);
  static const Color lightBeige = Color(0xFFE8D8C3);
  static const Color darkText = Color(0xFF252525);
  static const Color greyText = Color(0xFF6F6862);

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Internship Available',
      'message':
          'A new Software Engineering internship has been added.',
      'time': '10 minutes ago',
      'icon': Icons.work_outline_rounded,
      'read': false,
    },
    {
      'title': 'Scholarship Deadline',
      'message':
          'The International Student Scholarship deadline is approaching.',
      'time': '1 hour ago',
      'icon': Icons.school_outlined,
      'read': false,
    },
    {
      'title': 'Mentorship Update',
      'message':
          'A new mentorship opportunity is available for students.',
      'time': '3 hours ago',
      'icon': Icons.groups_outlined,
      'read': true,
    },
    {
      'title': 'New Training Program',
      'message':
          'A Digital Skills Bootcamp has been added to CampusLink.',
      'time': 'Yesterday',
      'icon': Icons.laptop_mac_outlined,
      'read': true,
    },
  ];

  void markAsRead(int index) {
    setState(() {
      notifications[index]['read'] = true;
    });
  }

  void markAllAsRead() {
    setState(() {
      for (final notification in notifications) {
        notification['read'] = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: burgundy,
        content: Text(
          'All notifications marked as read',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount = notifications
        .where(
          (notification) => notification['read'] == false,
        )
        .length;

    return Scaffold(
      backgroundColor: beige,

      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: burgundy,
          ),
        ),

        title: const Text(
          'Notifications',
          style: TextStyle(
            color: burgundy,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          if (unreadCount > 0)
            TextButton(
              onPressed: markAllAsRead,
              child: const Text(
                'Read all',
                style: TextStyle(
                  color: burgundy,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),

      body: notifications.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    size: 70,
                    color: burgundy,
                  ),

                  SizedBox(height: 15),

                  Text(
                    'No notifications',
                    style: TextStyle(
                      color: darkText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'You are all caught up!',
                    style: TextStyle(
                      color: greyText,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: notifications.length,

              itemBuilder: (context, index) {
                final notification = notifications[index];

                final bool isRead =
                    notification['read'] as bool;

                return GestureDetector(
                  onTap: () {
                    markAsRead(index);
                  },

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: isRead
                          ? Colors.white
                          : lightBeige,

                      borderRadius:
                          BorderRadius.circular(18),

                      border: isRead
                          ? null
                          : Border.all(
                              color: burgundy.withValues(
                                alpha: 0.25,
                              ),
                              width: 1,
                            ),
                    ),

                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Container(
                          width: 50,
                          height: 50,

                          decoration: BoxDecoration(
                            color: isRead
                                ? lightBeige
                                : burgundy,
                            borderRadius:
                                BorderRadius.circular(14),
                          ),

                          child: Icon(
                            notification['icon'],
                            color: isRead
                                ? burgundy
                                : Colors.white,
                            size: 25,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      notification['title'],
                                      style: TextStyle(
                                        color: darkText,
                                        fontSize: 15,
                                        fontWeight: isRead
                                            ? FontWeight.w600
                                            : FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  if (!isRead)
                                    Container(
                                      width: 9,
                                      height: 9,

                                      decoration:
                                          const BoxDecoration(
                                        color: burgundy,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              Text(
                                notification['message'],
                                style: const TextStyle(
                                  color: greyText,
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                notification['time'],
                                style: TextStyle(
                                  color: darkBurgundy.withValues(
                                    alpha: 0.7,
                                  ),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}