import 'package:dselect/providers/chat_provider.dart';
import 'package:dselect/service/chat_service.dart';
import 'package:dselect/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  ChatService chatService = ChatService();
  ChatProvider provider = ChatProvider();

  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = ChatProvider().getMessages();

  @override
  void initState() {
    chatService.loadQuestion();
    super.initState();
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) {
      ScaffoldMessengerState sms = ScaffoldMessenger.of(context);
      sms.clearSnackBars();
      sms.showSnackBar(const SnackBar(
        content: Text('Message should not be empty'),
      ));
      return;
    }

    _textController.clear();
    ChatMessage message = ChatMessage(text: text, isUserMessage: true);
    provider.addNewMessage(text);
    chatService.sendQuestion(text);

    Future.delayed(const Duration(seconds: 1), () {
      _addBotMessage(
          'Diabetes is a health condition where the body has trouble using or making a hormone called insulin. Insulin helps the body use sugar for energy. When someone has diabetes, their blood sugar levels can become too high, which can lead to health problems.');
    });
  }

  void _addBotMessage(String text) {
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: false,
    );
    setState(() {
      _messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Diabetes Chat Bot'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  const ChatMessage({
    super.key,
    this.text = '',
    this.isUserMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              child: Text(isUserMessage ? 'You' : 'Bot'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isUserMessage
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isUserMessage ? 'You' : 'Chatbot',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
