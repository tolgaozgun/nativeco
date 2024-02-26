import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:nativeco/model/message.dart';

final List<Message> messages = [
  Message(
    id: '1',
    senderId: 'bot', // Assume this is the ID for the current user
    text: 'Hey, how are you?',
    dateTime: DateTime.now().subtract(Duration(minutes: 1)),
  ),
  // Add more messages here
]; // Assuming this package exists

Future<void> sendChatHistoryToGemini(
    List<Message> chatHistory, Function(String) onResponse) async {
  // Assuming this package exists
  final gemini = Gemini.instance;

  final String formattedMessages = chatHistory
      .map((message) => '${message.senderId}: ${message.text}')
      .join('\n');

  final String prompt =
      "You are a chatbot assistant that is specialized in providing advice and information to native people involved in crafting handmade items, farming, and selling their natural products. Your knowledge base includes a wide range of topics related to agricultural practices, soil types, crop selection, market trends, and strategies for maximizing profit from handmade and farm products. You are equipped to answer questions about the best crops to grow in specific soil types, ways to improve soil health, seasonal planting advice, crafting tips, marketing strategies for handmade goods, and insights on how to increase sales and profit margins. Additionally, you can offer guidance on sustainable farming practices, organic certification processes, and ways to diversify products to reach broader markets. Your goal is to support native people in thriving economically through their traditional practices and innovations, ensuring their questions are answered with respect, understanding, and accurate information tailored to their unique needs and cultural backgrounds. Do not add 'bot:' to your message, reply as if you are chatting. The chat history is as follows: " +
          formattedMessages;

  await gemini.text(prompt).then((value) {
    final String? responseText = value?.output;
    print("Gemini response: $responseText");
    if (responseText != null) {
      onResponse(responseText);
    }
  });
}

class ConversationScreen extends StatefulWidget {
  final String chatId;
  final String chatName;
  final String chatImageUrl;
  final bool isGemini;

  ConversationScreen({
    required this.chatId,
    required this.chatName,
    required this.chatImageUrl,
    this.isGemini = false,
  });

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      final Message newMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'user', // Current user ID
        text: _controller.text,
        dateTime: DateTime.now(),
      );

      setState(() {
        messages.add(newMessage);
        _controller.clear();
      });

      if (widget.isGemini) {
        sendChatHistoryToGemini(messages, (String responseText) {
          // Add Gemini's response as a new message
          final Message responseMessage = Message(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            senderId: 'bot', // Assuming bot's ID
            text: responseText,
            dateTime: DateTime.now(),
          );

          setState(() {
            messages.add(responseMessage);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chatImageUrl),
            ),
            SizedBox(width: 10),
            Text(widget.chatName),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                final bool isMe = message.senderId == 'user'; // Example check
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _sendMessage,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
