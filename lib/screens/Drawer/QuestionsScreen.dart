import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Questions"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuestionCard(),
            QuestionCard(),
            QuestionCard(),
            QuestionCard()
          ],
        ),
      ),
    );
  }
}

Widget QuestionCard() => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is the circumference of the earth?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: InkWell(
                    child: Container(
                        child: Text('Answer',
                            style: TextStyle(color: Colors.redAccent))),
                    onTap: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
