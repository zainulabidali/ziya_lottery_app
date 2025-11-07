import 'package:flutter/material.dart';
import 'package:lottery_app/notification/notification_model/notification_model.dart';
import 'package:lottery_app/notification/widgets/delete_all_dialog.dart';
import 'package:lottery_app/notification/widgets/notification_tile.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> today = [
    NotificationModel(
      initials: "PA",
      title: "Your prediction for Today’s Akshaya lottery is ready",
      subtitle: "",
      time: "3 hours ago",
    ),
    NotificationModel(
      initials: "RS",
      title: "Nirmal Lottery results published — check now",
      subtitle: "",
      time: "5 hours ago",
    ),
  ];

  List<NotificationModel> yesterday = [
    NotificationModel(
      initials: "SB",
      title: "Your premium plan expires in 2 days",
      subtitle: "",
      time: "3 hours ago",
    ),
    NotificationModel(
      initials: "IU",
      title: "App updates & new features",
      subtitle: "Tips for using predictions",
      time: "5 hours ago",
    ),
  ];

  void deleteAll() {
    setState(() {
      today.clear();
      yesterday.clear();
    });
  }

  void _deleteWithUndo(NotificationModel n, List<NotificationModel> list) {
    setState(() => list.remove(n));

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("1 deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() => list.insert(0, n));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(248, 255, 255, 255),
        elevation: 0,
       actions: [
  Container(
    margin: const EdgeInsets.only(right: 12, top: 6, bottom: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      // borderRadius: BorderRadius.circular(10),
     
    
    ),
    child: PopupMenuButton(
      icon: const Icon(Icons.more_horiz, color: Colors.black),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: const [
              Icon(Icons.delete_outline, color: Colors.red),
              SizedBox(width: 8),
              Text(
                "Delete All",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          onTap: () {
            Future.delayed(
              const Duration(milliseconds: 100),
              () => showDialog(
                context: context,
                builder: (ctx) => DeleteAllDialog(onConfirm: deleteAll),
              ),
            );
          },
        ),
      ],
    ),
  ),
],

        
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          if (today.isNotEmpty) ...[
            const Text(
              "Today",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            ...today.map((n) => NotificationTile(
                  notification: n,
                  onDelete: () => _deleteWithUndo(n, today),
                  onUndo: () => setState(() => today.insert(0, n)),
                )),
            const SizedBox(height: 26),
          ],
          if (yesterday.isNotEmpty) ...[
            const Text(
              "Yesterday",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            ...yesterday.map((n) => NotificationTile(
                  notification: n,
                  onDelete: () => _deleteWithUndo(n, yesterday),
                  onUndo: () => setState(() => yesterday.insert(0, n)),
                )),
          ],
          const SizedBox(height: 24),
          const Center(
            child: Text(
              "That’s all your notification from last 30 days",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
