import 'package:flutter/material.dart';
import 'package:nativeco/components/chat_item.dart';
import 'package:nativeco/model/chat.dart';
import 'package:nativeco/pages/conversation.dart';

final List<Chat> chats = [
  Chat(
      id: '1',
      name: 'Gemini',
      message: 'Hello!',
      imageUrl:
          'https://scientyficworld.org/wp-content/uploads/2023/12/google_gemini.png',
      isGemini: true),
  Chat(
    id: '2',
    name: 'John Doe',
    message: 'Hey, how are you?',
    imageUrl: 'https://picsum.photos/200',
  ),
  // Add more chats here
];

class ChatFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatItem(
            chat: chats[index],
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ConversationScreen(
                          chatId: chats[index].id,
                          chatName: chats[index].name,
                          chatImageUrl: chats[index].imageUrl,
                          isGemini: chats[index].isGemini,
                        )),
              )
            },
          );
        },
      ),
    );
  }
}
