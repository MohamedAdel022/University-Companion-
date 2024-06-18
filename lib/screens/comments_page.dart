import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> comments = [
    {
      'username': 'Majd Abdulaziz',
      'comment': 'مواصفات جهازك',
      'time': '15m',
      'replies': [
        {
          'username': 'Mohammed Essa Gmal',
          'comment': 'gtx1660',
          'time': '10m',
        },
      ],
    },
    {
      'username': 'محمد الرعود',
      'comment': 'افشل لعبة نزلت في تاريخ',
      'time': '35m',
      'replies': [
        {
          'username': 'Mohammed Essa Gmal',
          'comment': 'ليش',
          'time': '30m',
        },
      ],
    },
    {
      'username': 'Ahmad Abbas',
      'comment': 'اسم اللعبة و مواصفات جهازك',
      'time': '45m',
      'replies': [
        {
          'username': 'Mohammed Essa Gmal',
          'comment': 'ستار فيلد',
          'time': '40m',
        },
      ],
    },
    {
      'username': 'Yusuf Mohamed Samy',
      'comment': 'دا خرز دا ولا أي',
      'time': '46m',
      'replies': [
        {
          'username': 'Mohammed Essa Gmal',
          'comment': 'ههه لا دمك خفيف',
          'time': '41m',
        },
      ],
    },
    {
      'username': 'Maki Zenin',
      'comment': 'عندي كرت rtx 3060 كم ممكن توصل فريمات',
      'time': '50m',
      'replies': [],
    },
  ];

  CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  // Check if the data is of the expected type
                  final commentData = comments[index];
                  final replies = commentData['replies'];
                  if (replies is List) {
                    return CommentCard(
                      username: commentData['username'] ?? '',
                      comment: commentData['comment'] ?? '',
                      time: commentData['time'] ?? '',
                      replies: replies.cast<Map<String, dynamic>>(),
                    );
                  }
                  return const SizedBox
                      .shrink(); // Empty widget for invalid data
                },
              ),
            ),
            const CommentInputField(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}

class CommentInputField extends StatefulWidget {
  const CommentInputField({super.key});

  @override
  _CommentInputFieldState createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _isTextFieldNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextFieldNotEmpty = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Write a comment...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return _isTextFieldNotEmpty
                    ? const LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds)
                    : const LinearGradient(
                        colors: [Colors.grey, Colors.grey],
                      ).createShader(bounds);
              },
              child: IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: _isTextFieldNotEmpty
                    ? () {
                        // Handle sending comment
                        print('Send button pressed');
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String username;
  final String comment;
  final String time;
  final List<Map<String, dynamic>> replies;

  const CommentCard({
    super.key,
    required this.username,
    required this.comment,
    required this.time,
    required this.replies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                comment,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  TextButton.icon(
                    icon: Image.asset(
                      'assets/like.png',
                      width: 18,
                      height: 18,
                    ),
                    label: const Text('Like'),
                    onPressed: () {
                      // Handle Like action
                    },
                  ),
                  TextButton.icon(
                    icon: Image.asset(
                      'assets/reply.png',
                      width: 18,
                      height: 18,
                    ),
                    label: const Text('Reply'),
                    onPressed: () {
                      // Handle Reply action
                    },
                  ),
                ],
              ),
              if (replies.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: replies.map((reply) {
                      return CommentCard(
                        username: reply['username'] ?? '',
                        comment: reply['comment'] ?? '',
                        time: reply['time'] ?? '',
                        replies: const [],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
