import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // Post 1 - Jerome
        NewsFeedCard(
          userName: 'Jerome Tugadi',
          postContent: 'angas',
          numOfLikes: 69,
          date: 'November 20',
          hasImage: true,
          profileImageUrl: 'https://i.pravatar.cc/150?img=11',
          postImageUrl: 'https://picsum.photos/seed/jerome/600/400',
        ),

        NewsFeedCard(
          userName: 'Matt Kusain',
          postContent: 'omggg',
          numOfLikes: 200,
          date: 'December 2',
          hasImage: true,
          profileImageUrl: 'https://i.pravatar.cc/150?img=12',
          postImageUrl: 'https://picsum.photos/seed/matt/600/400',
        ),
      ],
    );
  }
}