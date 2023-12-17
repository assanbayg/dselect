import 'package:dselect/screens/chat/chat_screen.dart';
import 'package:dselect/service/chat_service.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  static final ChatProvider _instance = ChatProvider._internal();

  factory ChatProvider() {
    return _instance;
  }

  ChatProvider._internal();

  List<ChatMessage> chatMessages = [];

  void addNewMessage(String questionText) async {
    ChatService service = ChatService();
    final res = await service.sendQuestion(questionText);

    chatMessages.add(ChatMessage(
      text: res["chat"]["question_text"],
      isUserMessage: true,
    ));
    chatMessages.add(ChatMessage(
      text: res["chat"]["answer_text"],
      isUserMessage: false,
    ));
    notifyListeners();
  }

  Future<void> getMessages() async {
    final messages = await ChatService().loadQuestion();
    List<ChatMessage> newList = [];
    for (final item in messages) {
      newList.add(ChatMessage(
        text: item["question_text"],
        isUserMessage: true,
      ));
      newList.add(ChatMessage(
        text: item["answer_text"],
        isUserMessage: false,
      ));
    }
    chatMessages = newList;
    notifyListeners();
  }
}
