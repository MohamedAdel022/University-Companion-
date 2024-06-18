import 'dart:async';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [
    {
      'sender': 'bot',
      'text': 'Hello! How can I help you today?',
      'displayedText': ''
    },
    // Add more initial messages here if needed
  ];

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'sender': 'user', 'text': text, 'displayedText': text});
        _controller.clear();
        _simulateBotResponse('You said: $text');
        _scrollToBottom();
      });
    }
  }

  void _simulateBotResponse(String responseText) {
    final response = {
      'sender': 'bot',
      'text': responseText,
      'displayedText': ''
    };
    messages.add(response);
    int currentIndex = messages.length - 1;

    int charIndex = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (charIndex < responseText.length) {
        setState(() {
          messages[currentIndex]['displayedText'] = messages[currentIndex]
                  ['displayedText']! +
              responseText[charIndex];
        });
        charIndex++;
        _scrollToBottom();
      } else {
        timer.cancel();
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isBot = message['sender'] == 'bot';
                return Container(
                  alignment:
                      isBot ? Alignment.centerLeft : Alignment.centerRight,
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isBot ? Colors.purple[50] : Colors.purple[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    child: Text(
                      message['displayedText']!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
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
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.purple),
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
