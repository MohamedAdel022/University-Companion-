import 'package:flutter/material.dart';
import 'package:test/screens/course_detail_page.dart';

class CoursesPage extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'name': 'Flutter Development',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {'name': 'React Native', 'imageUrl': 'https://via.placeholder.com/150'},
    {
      'name': 'Python Programming',
      'imageUrl': 'https://via.placeholder.com/150'
    },
    {'name': 'Data Science', 'imageUrl': 'https://via.placeholder.com/150'},
    {'name': 'Machine Learning', 'imageUrl': 'https://via.placeholder.com/150'},
    {
      'name': 'Artificial Intelligence',
      'imageUrl': 'https://via.placeholder.com/150'
    },
  ];

  CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.blue, Colors.purpleAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: const Text(
            'Your Courses',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CourseDetailPage(
                    name: course['name']!,
                    imageUrl: course['imageUrl']!,
                  );
                }));
              },
              child: CourseCard(
                name: course['name']!,
                imageUrl: course['imageUrl']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CourseCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
