/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:barter_project_2023/features/chat/presentation/view/widgets/custom_text_field.dart';
import '../../view_model/cubits/chatCubit/chat_cubit.dart';
import 'groubed_list_view.dart';

class ChatPageBody extends StatefulWidget {
  final String email;

  const ChatPageBody({Key? key, required this.email}) : super(key: key);

  @override
  State<ChatPageBody> createState() => _ChatPageBodyState();
}

class _ChatPageBodyState extends State<ChatPageBody> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textControler = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    textControler.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              if (state is ChatSuccess) {
                scrollController.animateTo(
                  scrollController.position.minScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              }
            },
            builder: (context, state) {
              return GroupedListViewBuilder(
                scrollController: scrollController,
                email: widget.email,
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: const Color(0xffF2F2F2),
          child: ChatTextField(
            email: widget.email,
            textControler: textControler,
          ),
        ),
      ],
    );
  }
}
 */