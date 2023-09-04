import 'package:barter_project_2023/features/chat/presentation/view/chat_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../view_model/cubits/chatCubit/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color(0xffD9D9D9),
              height: 1,
            ),
          ),
          title: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  '',
                ),
              ),
              SizedBox(width: 6.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name', // Replace with user's name
                    style: TextStyle(
                        fontSize: 15.sp, color: const Color(0xff838283)),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Text(
                    'online now',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff4CD964),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ChatPageBody(email: email),
      ),
    );
  }
}
