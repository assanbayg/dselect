import 'package:dselect/screens/chat/chat_screen.dart';
import 'package:dselect/service/chat_service.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  List<ChatMessage> chatMessages = [];

  void addNewMessage(String questionText) async {
    ChatService service = ChatService();
    final res = await service.sendQuestion(questionText);

    for (final item in res) {
      chatMessages.add(ChatMessage(
        text: item["question_text"],
        isUserMessage: true,
      ));
      chatMessages.add(ChatMessage(
        text: item["answer_text"],
        isUserMessage: false,
      ));
    }
    notifyListeners();
  }

  List<ChatMessage> getMessages() {
    final mappedMessages = ChatService().loadQuestion();
    print(mappedMessages);
    print(mappedMessages.runtimeType);
    return chatMessages;
  }
}
