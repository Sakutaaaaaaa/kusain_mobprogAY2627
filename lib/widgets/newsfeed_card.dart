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

  final TextEditingController commentController = TextEditingController();
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

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

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

  void sharePost() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Post shared successfully!'),
      ),
    );
  }

  Widget buildProfileImage() {
    return CircleAvatar(
      radius: ScreenUtil().setSp(20),
      backgroundColor: FB_LIGHT_PRIMARY,
      backgroundImage: widget.profileImageUrl != null
          ? NetworkImage(widget.profileImageUrl!)
          : null,
      child: widget.profileImageUrl == null
          ? Icon(
              Icons.person,
              color: FB_DARK_PRIMARY,
              size: ScreenUtil().setSp(25),
            )
          : null,
    );
  }

  Widget buildPostImage() {
    if (widget.postImageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          widget.postImageUrl!,
          width: double.infinity,
          height: ScreenUtil().setHeight(200),
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
      decoration: BoxDecoration(
        color: FB_TEXT_COLOR_WHITE,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: FB_LIGHT_PRIMARY),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: ScreenUtil().setSp(45),
            color: FB_SECONDARY,
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          const Text(
            'Post image placeholder',
            style: TextStyle(color: FB_DARK_PRIMARY),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
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
                        color: FB_DARK_PRIMARY,
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
                const Icon(Icons.more_horiz, color: FB_DARK_PRIMARY),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // Post content
            CustomText(
              text: widget.postContent,
              fontSize: ScreenUtil().setSp(13),
              color: Colors.black87,
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // Optional post image or placeholder
            if (widget.hasImage) buildPostImage(),

            SizedBox(height: ScreenUtil().setHeight(8)),

            // Like count and comment count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: FB_PRIMARY,
                      size: ScreenUtil().setSp(15),
                    ),
                    const SizedBox(width: 5),
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
                    isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                    color: isLiked ? FB_PRIMARY : FB_DARK_PRIMARY,
                  ),
                  label: CustomText(
                    text: 'Like',
                    fontSize: ScreenUtil().setSp(12),
                    color: isLiked ? FB_PRIMARY : FB_DARK_PRIMARY,
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
                      color: FB_TEXT_COLOR_WHITE,
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
                            color: FB_PRIMARY,
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
                text: showComments ? 'Hide comments' : 'View comments',
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.bold,
                color: FB_DARK_PRIMARY,
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
                        backgroundColor: FB_LIGHT_PRIMARY,
                        child: Icon(
                          Icons.person,
                          size: ScreenUtil().setSp(15),
                          color: FB_DARK_PRIMARY,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(8)),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(
                            ScreenUtil().setSp(10),
                          ),
                          decoration: BoxDecoration(
                            color: FB_TEXT_COLOR_WHITE,
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