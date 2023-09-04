// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'package:barter_project_2023/features/chat/presentation/view/widgets/chat_buble.dart';
import 'package:barter_project_2023/features/chat/presentation/view/widgets/custom_text_field.dart';

import '../../data/models/messege.dart';
import '../view_model/cubits/chatCubit/chat_cubit.dart';

class ChatPageBody extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textControler = TextEditingController();
  final String email;

  List<Message> messagesList = [];
  ChatPageBody({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 17),
                              child: Text(
                                'Today',
                                style: TextStyle(
                                    fontSize: 13.sp,
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
                                style: TextStyle(
                                    fontSize: 13.sp,
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
    );
  }
}
