import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hello! Welcome to the chat.',
      'isMe': false,
    },
    {
      'text': 'Hi! How are you?',
      'isMe': true,
    },
  ];

  void sendMessage() {
    final message = messageController.text.trim();

    if (message.isEmpty) return;

    setState(() {
      messages.add({
        'text': message,
        'isMe': true,
      });
    });

    messageController.clear();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            SizedBox(width: 10),
            Text('Chat'),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['isMe'] as bool;

                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isMe
                          ? Colors.deepPurple
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      message['text'],
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                    onSubmitted: (_) => sendMessage(),
                  ),
                ),

                const SizedBox(width: 8),

                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}