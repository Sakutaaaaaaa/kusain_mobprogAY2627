
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;

  // Enhancement 1 and 2: Optional image URLs
  final String? profileImageUrl;
  final String? postImageUrl;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    this.hasImage = false,
    required this.date,
    this.profileImageUrl,
    this.postImageUrl,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  late int likes;
  bool isLiked = false;
  bool showCommentField = false;
  bool showComments = false;

  final TextEditingController commentController =
      TextEditingController();

  final List<String> comments = [];

  @override
  void initState() {
    super.initState();
    likes = widget.numOfLikes;
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  // Enhancement 3: Like and Unlike
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  // Enhancement 3: Submit comment
  void addComment() {
    final comment = commentController.text.trim();

    if (comment.isEmpty) return;

    setState(() {
      comments.add(comment);
      commentController.clear();
      showComments = true;
      showCommentField = false;
    });

    FocusScope.of(context).unfocus();
  }

  // Enhancement 3: Share button
  void sharePost() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Post shared successfully!'),
      ),
    );
  }

  // Profile image with fallback avatar
  Widget buildProfileImage() {
    return CircleAvatar(
      radius: ScreenUtil().setSp(20),
      backgroundColor: Colors.grey[300],
      backgroundImage: widget.profileImageUrl != null
          ? NetworkImage(widget.profileImageUrl!)
          : null,
      child: widget.profileImageUrl == null
          ? Icon(
              Icons.person,
              color: Colors.grey[700],
              size: ScreenUtil().setSp(25),
            )
          : null,
    );
  }

  // Post image with placeholder fallback
  Widget buildPostImage() {
    if (widget.postImageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          widget.postImageUrl!,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return buildImagePlaceholder();
          },
        ),
      );
    }

    return buildImagePlaceholder();
  }

  Widget buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(180),
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: ScreenUtil().setSp(45),
            color: Colors.grey,
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          const Text(
            'Post image placeholder',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile header
            Row(
              children: [
                buildProfileImage(),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: widget.date,
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.grey,
                          ),
                          SizedBox(width: ScreenUtil().setWidth(3)),
                          Icon(
                            Icons.public,
                            color: Colors.grey,
                            size: ScreenUtil().setSp(15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // Post content
            CustomText(
              text: widget.postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // Enhancement 2: Post image
            if (widget.hasImage) buildPostImage(),

            SizedBox(height: ScreenUtil().setHeight(5)),

            // Like count and comment count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.blue,
                      size: ScreenUtil().setSp(15),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '$likes',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                Text(
                  '${comments.length} Comments',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),

            const Divider(),

            // Like, Comment and Share buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: toggleLike,
                  icon: Icon(
                    isLiked
                        ? Icons.thumb_up
                        : Icons.thumb_up_outlined,
                    color: isLiked ? Colors.blue : FB_DARK_PRIMARY,
                  ),
                  label: CustomText(
                    text: 'Like',
                    fontSize: ScreenUtil().setSp(12),
                    color: isLiked ? Colors.blue : FB_DARK_PRIMARY,
                  ),
                ),

                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      showCommentField = !showCommentField;
                    });
                  },
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: FB_DARK_PRIMARY,
                  ),
                  label: CustomText(
                    text: 'Comment',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),

                TextButton.icon(
                  onPressed: sharePost,
                  icon: const Icon(
                    Icons.share_outlined,
                    color: FB_DARK_PRIMARY,
                  ),
                  label: CustomText(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_DARK_PRIMARY,
                  ),
                ),
              ],
            ),

            const Divider(),

            // Comment input
            Row(
              children: [
                buildProfileImage(),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: commentController,
                            decoration: const InputDecoration(
                              hintText: 'Write a comment...',
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                            ),
                            onSubmitted: (_) => addComment(),
                          ),
                        ),
                        IconButton(
                          onPressed: addComment,
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // View comments
            GestureDetector(
              onTap: () {
                setState(() {
                  showComments = !showComments;
                });
              },
              child: CustomText(
                text: showComments
                    ? 'Hide comments'
                    : 'View comments',
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Display submitted comments
            if (showComments)
              ...comments.map(
                (comment) => Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: ScreenUtil().setSp(12),
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: ScreenUtil().setSp(15),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(8)),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(
                            ScreenUtil().setSp(10),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            comment,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
