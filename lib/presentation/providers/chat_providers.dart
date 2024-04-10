import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

List <Message> messageList = [
  Message(text: 'Hola amor', fromWho: FromWho.me),
  Message(text: 'Ya regresaste?', fromWho: FromWho.me)
];

Future <void> herReplay() async {
  final herMessage = await getYesNoAnswer.getAnswer();

  messageList.add(herMessage);
  notifyListeners();
  moveScrollToBottom();

}
Future <void> sendMessage (String text) async {
  if (text.isEmpty)return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

  if ( text.endsWith('?') ) {
     herReplay();
  }


  notifyListeners();
  moveScrollToBottom();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    moveScrollToBottom();
 });

}

  void moveScrollToBottom() {

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }
}