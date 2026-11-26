import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

class Notification extends StatelessWidget {
  const Notification({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    this.date = '',
  });

  final String name;
  final String post;
  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
        vertical: ScreenUtil().setHeight(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: ScreenUtil().setSp(24),
            backgroundColor: FB_LIGHT_PRIMARY,
            child: Icon(
              Icons.person,
              size: ScreenUtil().setSp(28),
              color: FB_DARK_PRIMARY,
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  fontSize: ScreenUtil().setSp(16),
                  color: FB_DARK_PRIMARY,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(height: ScreenUtil().setHeight(2)),
                CustomText(
                  text: 'Posted: $post',
                  fontSize: ScreenUtil().setSp(13),
                  color: Colors.black87,
                ),
                CustomText(
                  text: description,
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.grey[700]!,
                  fontStyle: FontStyle.italic,
                ),
                if (date.isNotEmpty) ...[
                  SizedBox(height: ScreenUtil().setHeight(2)),
                  CustomText(
                    text: date,
                    fontSize: ScreenUtil().setSp(11),
                    color: FB_SECONDARY,
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(8)),
          const Icon(Icons.more_horiz, color: FB_DARK_PRIMARY),
        ],
      ),
    );
  }
}