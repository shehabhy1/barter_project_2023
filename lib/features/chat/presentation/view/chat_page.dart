/* import 'package:barter_project_2023/features/chat/presentation/view/widgets/chat_page_body.dart';
import 'package:barter_project_2023/features/chat/presentation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubits/chatCubit/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments.toString();

    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: customAppBarBody(),
        body: ChatPageBody(email: email),
      ),
    );
  }
}
 */