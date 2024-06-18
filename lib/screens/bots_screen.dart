import 'package:flutter/material.dart';
import 'package:test/screens/bot_chat_screen.dart';

class BotsScreen extends StatelessWidget {
  final List<String> bots = [
    'General chatbot',
    'Curriculum chatbot',
    'Summarization chatbot',
    'Improve writing chatbot',
    'Create quizzes chatbot',
    'Evaluate quizzes chatbot',
  ];

  final List<Bot> eliteTools = [
    Bot(
        name: 'Genral chatbot',
        description: 'Real-time chat with a bot',
        icon: 'assets/bot/chatbot.png'),
    Bot(
        name: 'Curriculum chatbot',
        description: 'Translate text to different languages',
        icon: 'assets/bot/bot (1).png'),
    Bot(
      name: 'summarization chatbot',
      description: 'Summarize text to the main points',
      icon: 'assets/bot/web.png',
    ),
    Bot(
        name: 'improve writing chatbot',
        description: 'Check grammar and spelling mistakes',
        icon: 'assets/bot/ai-writing.png'),
    Bot(
        name: 'create quizes chatbot',
        description: 'Create quizzes for your students',
        icon: 'assets/bot/robot.png'),
    Bot(
        name: 'evaluate quizes chatbot',
        description: 'Evaluate quizzes for your students',
        icon: 'assets/bot/robot (1).png'),
  ];

  final List<Map<String, String>> history = [
    {
      'title': 'Invalid input',
      'description': 'See your recent conversation',
      'icon': 'error'
    },
    // Add more history items here
  ];

  BotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat & Ask'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Elite Tools',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eliteTools.length,
                itemBuilder: (context, index) {
                  final tool = eliteTools[index];
                  return SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the tool screen
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChatScreen(
                            // Change this to the tool screen
                            name: tool.name,
                            description: tool.description,
                            icon: tool.icon,
                          );
                        }));
                      },
                      child: Card(
                        color: Colors.purple[50],
                        margin: const EdgeInsets.only(right: 16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) {
                                  return const LinearGradient(
                                    colors: [Colors.white, Colors.purple],
                                  ).createShader(bounds);
                                },
                                child: Image.asset(
                                  tool.icon,
                                  width: 64,
                                  height: 64,
                                  color: Colors.purple,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                tool.name,
                                style: const TextStyle(color: Colors.purple),
                              ),
                              Text(tool.description),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'My History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final item = history[index];
                  return Card(
                    color: Colors.purple[50],
                    child: ListTile(
                      title: Text(item['title']!),
                      subtitle: Text(item['description']!),
                      trailing:
                          const Icon(Icons.delete, color: Colors.deepPurple),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Bot {
  String name;
  String description;
  String icon;

  Bot({required this.name, required this.description, required this.icon});
}
