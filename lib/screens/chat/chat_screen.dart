import 'package:dselect/providers/chat_provider.dart';
import 'package:dselect/service/chat_service.dart';
import 'package:dselect/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = 'navbar/chat';
  const ChatScreen({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  ChatService chatService = ChatService();
  ChatProvider provider = ChatProvider();
  bool isVisible = false;

  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeMessages();
    });
  }

  Future<void> _initializeMessages() async {
    _messages = Provider.of<ChatProvider>(context, listen: false).chatMessages;
    await ChatProvider().getMessages();
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

    Future.delayed(const Duration(seconds: 3), () {
      _addBotMessage(_messages.last.text);
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
          isVisible
              ? Container()
              : Center(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isVisible = true;
                        });
                      },
                      child: Text('Load all'))),
          isVisible
              ? (Expanded(
                  child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) => _messages[index],
                  ),
                ))
              : Container(),
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
