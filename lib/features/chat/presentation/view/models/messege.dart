
import '../../../../../constants.dart';

class Message {
  final String message;
  final String id;
  final String mtime;

  Message(this.message, this.id, this.mtime);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessege], (jsonData[kID]), (jsonData[kMTime]));
  }
}