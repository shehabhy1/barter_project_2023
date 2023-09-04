import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController textControler;
  final String email;
  const ChatTextField({
    super.key,
    required this.textControler,
    required this.email,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textControler,
      onSubmitted: (data) {
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
