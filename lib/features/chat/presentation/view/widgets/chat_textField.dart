import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/chatCubit/chat_cubit.dart';

class ChatTextField extends StatelessWidget {
  ChatTextField({
    super.key,
    //required this.scrollcontroller,
    required this.textControler,
    //required this.messages,
    required this.email,
  });
  //final ScrollController scrollcontroller;
  final TextEditingController textControler;
  //final CollectionReference<Object?> messages;
  var email;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textControler,
      onSubmitted: (data) {
        // BlocProvider.of<ChatCubit>(context)
        //     .sendMessege(messege: data, email: email);
        textControler.clear();
      },
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
        // hintText: 'Enter messege',
        labelText: 'send message',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 124, 124, 124)),
        // hintStyle: TextStyle(color: kPrimaryColor),
        // labelStyle: TextStyle(color: kPrimaryColor),

        suffixIcon: Container(
          decoration: const BoxDecoration(
            color: Color(0xffB73BFF),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send, color: Colors.white)),
        ),
        prefixIcon: IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.emoji_emotions_outlined, color: Colors.grey)),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: const BorderSide(color: kPrimaryColor),
        // ),
        focusedBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
