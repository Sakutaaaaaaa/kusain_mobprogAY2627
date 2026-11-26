import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/notification.dart' as notif;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  static const _notifications = [
    _NotificationItem(
      name: 'Jerome Tugadi',
      post: 'New Desk Setup',
      description: 'Liked your recent photo and left a comment.',
      date: '2m ago',
    ),
    _NotificationItem(
      name: 'Katelyn Urbano',
      post: 'Morning Greetings',
      description: 'Mentioned you in a status update.',
      date: '10m ago',
    ),
    _NotificationItem(
      name: 'John Mark',
      post: 'Coffee & Code',
      description: 'Reacted to your post on Kusain Social.',
      date: '25m ago',
    ),
    _NotificationItem(
      name: 'Aira Jane',
      post: 'Daily Motivation',
      description: 'Shared a quote you might like.',
      date: '42m ago',
    ),
    _NotificationItem(
      name: 'Christian Reyes',
      post: 'Weekend Ride',
      description: 'Tagged you in an upcoming event.',
      date: '1h ago',
    ),
    _NotificationItem(
      name: 'Angela Cruz',
      post: 'Project Milestone',
      description: 'Commented: "Congrats on finishing early!"',
      date: '1h ago',
    ),
    _NotificationItem(
      name: 'Mark Santos',
      post: 'Food Trip',
      description: 'Invited you to join a local foodies group.',
      date: '2h ago',
    ),
    _NotificationItem(
      name: 'Nicole Garcia',
      post: 'Positive Vibes',
      description: 'Liked your comment on her post.',
      date: '3h ago',
    ),
    _NotificationItem(
      name: 'David Lim',
      post: 'Tech Talk',
      description: 'Shared your post to his timeline.',
      date: '4h ago',
    ),
    _NotificationItem(
      name: 'Paolo Mendoza',
      post: 'Flutter UI Tips',
      description: 'Posted a new tutorial in Mobile Dev PH.',
      date: '5h ago',
    ),
    _NotificationItem(
      name: 'Bea Villanueva',
      post: 'Campus Event',
      description: 'Reminded you about the seminar tomorrow.',
      date: '6h ago',
    ),
    _NotificationItem(
      name: 'Carlo Aquino',
      post: 'Gaming Night',
      description: 'Invited you to a Valorant custom lobby.',
      date: '7h ago',
    ),
    _NotificationItem(
      name: 'Trisha Mae',
      post: 'Study Playlist',
      description: 'Added a new link to your shared group.',
      date: '9h ago',
    ),
    _NotificationItem(
      name: 'Miguel Torres',
      post: 'Hardware Upgrade',
      description: 'Replied to your comment about RAM timings.',
      date: '12h ago',
    ),
    _NotificationItem(
      name: 'Sophia Ramos',
      post: 'Art Showcase',
      description: 'Posted a new illustration in Design Club.',
      date: 'Yesterday',
    ),
    _NotificationItem(
      name: 'Joshua Bautista',
      post: 'Capstone Prep',
      description: 'Uploaded updated slides for the defense.',
      date: 'Yesterday',
    ),
    _NotificationItem(
      name: 'Hannah Morales',
      post: 'Throwback Photo',
      description: 'Tagged you and 4 others in a photo.',
      date: '2 days ago',
    ),
    _NotificationItem(
      name: 'Kevin Castillo',
      post: 'Git Workflow',
      description: 'Starred your repository update post.',
      date: '2 days ago',
    ),
    _NotificationItem(
      name: 'Bianca Flores',
      post: 'Community Poll',
      description: 'Asked for your vote on the org shirt design.',
      date: '3 days ago',
    ),
    _NotificationItem(
      name: 'Rafael Navarro',
      post: 'Welcome to Kusain Social',
      description: 'Accepted your friend request.',
      date: '4 days ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: ListView.separated(
        itemCount: _notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = _notifications[index];
          return notif.Notification(
            name: item.name,
            post: item.post,
            description: item.description,
            date: item.date,
          );
        },
      ),
    );
  }
}

class _NotificationItem {
  const _NotificationItem({
    required this.name,
    required this.post,
    required this.description,
    required this.date,
  });

  final String name;
  final String post;
  final String description;
  final String date;
}