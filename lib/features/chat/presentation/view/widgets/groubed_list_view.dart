import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../../data/models/messege.dart';
import '../../view_model/cubits/chatCubit/chat_cubit.dart';
import 'chat_buble.dart';

class GroupedListViewBuilder extends StatelessWidget {
  const GroupedListViewBuilder({
    super.key,
    required this.scrollController,
    required this.email,
  });

  final ScrollController scrollController;
  final String email;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<Message, String>(
      physics: const ClampingScrollPhysics(),
      reverse: true,
      order: GroupedListOrder.DESC,
      sort: false,
      controller: scrollController,
      elements: BlocProvider.of<ChatCubit>(context).messagesList,
      groupBy: (message) =>
          DateFormat('yyyy-MM-dd').format(DateTime.parse(message.mtime)),
      groupSeparatorBuilder: (String date) {
        final todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
        return date == todayDate
            ? Center(
                child: Card(
                  color: Colors.grey[300],
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 17),
                    child: Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            : Center(
                child: Card(
                  color: Colors.grey[300],
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 17),
                    child: Text(
                      DateFormat('MMMM d').format(DateTime.parse(date)),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
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
  }
}
