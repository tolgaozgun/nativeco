import 'package:flutter/material.dart';
import 'package:nativeco/model/chat.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;
  final VoidCallback? onTap;

  const ChatItem({super.key, required this.chat, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: chat.isGemini ? Colors.green[200] : Colors.white,
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.imageUrl),
      ),
      title: Text(chat.name),
      subtitle: Text(chat.message),
    );
  }
}
