// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubits/chatCubit/chat_cubit.dart';

class ChatTextField extends StatelessWidget {
  final String email;
  final TextEditingController textControler;
  const ChatTextField({
    Key? key,
    required this.email,
    required this.textControler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textControler,
      onSubmitted: (data) {
        BlocProvider.of<ChatCubit>(context)
            .sendMessege(messege: data, email: email);
        textControler.clear();
      },
      decoration: InputDecoration(
        labelText: 'send message',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 124, 124, 124)),
        suffixIcon: Container(
          decoration: const BoxDecoration(
            color: Color(0xffB73BFF),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: IconButton(
            onPressed: () {
              BlocProvider.of<ChatCubit>(context)
                  .sendMessege(messege: textControler.text, email: email);
              textControler.clear();
            },
            icon: const Icon(Icons.send, color: Colors.white),
          ),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
