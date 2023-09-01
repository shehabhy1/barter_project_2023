import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../../../constants.dart';
import '../../models/messege.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessegesCollection);
  List<Message> messagesList = [];

  void sendMessege({required String messege, required String email}) {
    {
      try {
        messages.add(
          {
            kMessege: messege,
            kMTime: DateTime.now().toString(),
            kID: email,
          },
        );
      } on Exception {
        // TODO
      }
    }
  }

  void getMessege() {
    messages.orderBy(kMTime, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });

  }
}
