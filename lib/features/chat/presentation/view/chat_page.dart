import 'package:barter_project_2023/features/chat/presentation/view/widgets/chatBuble.dart';
import 'package:barter_project_2023/features/chat/presentation/view/widgets/chat_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../data/models/messege.dart';
import '../view_model/cubits/chatCubit/chat_cubit.dart';


class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  ChatPage({super.key});

  final ScrollController scrollController = ScrollController();
  final TextEditingController textControler = TextEditingController();
  List<Message> messagesList = [];
  DateTime? time;

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
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
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(''),
            ),
            SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name', // Replace with user's name
                  style: TextStyle(fontSize: 17, color: Color(0xff838283)),
                ),
                SizedBox(
                  height: 4,
                ),
                Text('online now',
                    style: TextStyle(fontSize: 15, color: Color(0xff4CD964))),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messagesList = state.messages;
                  scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
              },
              builder: (context, state) {
                return GroupedListView<Message, String>(
                  physics: const ClampingScrollPhysics(),
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  sort: false,
                  controller: scrollController,
                  elements: messagesList,
                  groupBy: (message) => DateFormat('yyyy-MM-dd')
                      .format(DateTime.parse(message.mtime)),
                  groupSeparatorBuilder: (String date) {
                    final todayDate =
                        DateFormat('yyyy-MM-dd').format(DateTime.now());
                    return date == todayDate
                        ? Center(
                            child: Card(
                              color: Colors.grey[300],
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 17),
                                child: Text(
                                  'Today',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Card(
                              color: Colors.grey[300],
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 17),
                                child: Text(
                                  DateFormat('MMMM d')
                                      .format(DateTime.parse(date)),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                  },
                  itemBuilder: (context, Message message) {
                    return message.id == email
                        ? ChatBuble(
                            message: message,
                          )
                        : ChatBubleForFriend(message: message);
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: const Color(0xffF2F2F2),
            child: ChatTextField(
              textControler: textControler,
              email: email,
            ),
          ),
        ],
      ),
    );
  }
}
