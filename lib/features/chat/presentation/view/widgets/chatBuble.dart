import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/messege.dart';

class ChatBuble extends StatelessWidget {
  final Message message;

  const ChatBuble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: const NetworkImage(
              '',
            ),
            radius: 20.sp,
          ),
          SizedBox(width: 7.w),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, bottom: 10, top: 5),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xffB73BFF), width: 1.w),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(7),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Stack(
                  // alignment: Alignment.,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 60,
                        bottom: 10,
                      ),
                      child: Text(
                        message.message,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      right: -1,
                      child: Text(
                        DateFormat("hh:mm a")
                            .format(DateTime.parse(message.mtime)),
                        style:
                            TextStyle(fontSize: 10.sp, color: Colors.grey[700]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, bottom: 10, top: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(7),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(7),
                  ),
                  color: Color(0xffB73BFF),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 3,
                        right: 70,
                        bottom: 10,
                      ),
                      child: Text(
                        message.message,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      right: -1,
                      child: Row(
                        children: [
                          Text(
                            DateFormat("hh:mm a")
                                .format(DateTime.parse(message.mtime)),
                            style: const TextStyle(
                                fontSize: 10.0, color: Colors.white),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(width: 2.w),
                          Icon(Icons.done_all, size: 13.sp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 7.w),
          CircleAvatar(
            backgroundImage: const NetworkImage(
              '',
            ),
            radius: 20.sp,
          ),
        ],
      ),
    );
  }
}
