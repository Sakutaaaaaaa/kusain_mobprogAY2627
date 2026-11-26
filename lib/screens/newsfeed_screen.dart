import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  static const _posts = [
    _PostItem(
      userName: 'Jerome Tugadi',
      postContent: 'Angas ng bagong setup ngayon!',
      numOfLikes: 69,
      date: 'November 20',
      hasImage: true,
      profileImageUrl: 'https://i.pravatar.cc/150?img=11',
      postImageUrl: 'https://picsum.photos/seed/jerome/600/400',
    ),
    _PostItem(
      userName: 'Matt Kusain',
      postContent: 'Finally wrapped up our Flutter lab enhancements!',
      numOfLikes: 200,
      date: 'November 21',
      hasImage: true,
      profileImageUrl: 'https://i.pravatar.cc/150?img=12',
      postImageUrl: 'https://picsum.photos/seed/matt/600/400',
    ),
    _PostItem(
      userName: 'Katelyn Urbano',
      postContent: 'Good morning everyone! Hope you have a productive week.',
      numOfLikes: 45,
      date: 'November 21',
      hasImage: false,
      profileImageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
    _PostItem(
      userName: 'John Mark',
      postContent: 'Enjoying my day with some good coffee and coding.',
      numOfLikes: 87,
      date: 'November 22',
      hasImage: true,
      profileImageUrl: 'https://i.pravatar.cc/150?img=13',
      postImageUrl: 'https://picsum.photos/seed/john/600/400',
    ),
    _PostItem(
      userName: 'Aira Jane',
      postContent: 'Keep going, you are doing great.',
      numOfLikes: 120,
      date: 'November 22',
      hasImage: false,
      profileImageUrl: 'https://i.pravatar.cc/150?img=9',
    ),
    _PostItem(
      userName: 'Christian Reyes',
      postContent: 'Weekend vibes! Uploading photos soon.',
      numOfLikes: 56,
      date: 'November 23',
      hasImage: true,
      profileImageUrl: 'https://i.pravatar.cc/150?img=14',
    ),
    _PostItem(
      userName: 'Angela Cruz',
      postContent: 'Finally finished my project ahead of the deadline!',
      numOfLikes: 310,
      date: 'November 23',
      hasImage: false,
      profileImageUrl: 'https://i.pravatar.cc/150?img=20',
    ),
    _PostItem(
      userName: 'Mark Santos',
      postContent: 'Nothing beats good food after a long day.',
      numOfLikes: 95,
      date: 'November 24',
      hasImage: true,
      profileImageUrl: 'https://i.pravatar.cc/150?img=15',
      postImageUrl: 'https://picsum.photos/seed/mark/600/400',
    ),
    _PostItem(
      userName: 'Nicole Garcia',
      postContent: 'Stay positive and take breaks when you need them!',
      numOfLikes: 150,
      date: 'November 25',
      hasImage: false,
      profileImageUrl: 'https://i.pravatar.cc/150?img=24',
    ),
    _PostItem(
      userName: 'David Lim',
      postContent: 'Another day, another opportunity to build something cool.',
      numOfLikes: 72,
      date: 'November 26',
      hasImage: true,
      profileImageUrl: 'https://i.pravatar.cc/150?img=16',
      postImageUrl: 'https://picsum.photos/seed/david/600/400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          userName: post.userName,
          postContent: post.postContent,
          numOfLikes: post.numOfLikes,
          date: post.date,
          hasImage: post.hasImage,
          profileImageUrl: post.profileImageUrl,
          postImageUrl: post.postImageUrl,
        );
      },
    );
  }
}

class _PostItem {
  const _PostItem({
    required this.userName,
    required this.postContent,
    required this.numOfLikes,
    required this.date,
    required this.hasImage,
    this.profileImageUrl,
    this.postImageUrl,
  });

  final String userName;
  final String postContent;
  final int numOfLikes;
  final String date;
  final bool hasImage;
  final String? profileImageUrl;
  final String? postImageUrl;
}