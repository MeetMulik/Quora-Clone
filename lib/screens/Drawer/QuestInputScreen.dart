import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestInputScreen extends StatefulWidget {
  const QuestInputScreen({super.key});

  @override
  State<QuestInputScreen> createState() => _QuestInputScreenState();
}

class _QuestInputScreenState extends State<QuestInputScreen> {
  final TextEditingController _controllerT = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Add Question"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerT,
              decoration: InputDecoration(
                labelText: 'Add Question',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  String input2 = _controllerT.text;
                  createQuestion(input2);
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future createQuestion(String input2) async {
    final docQuestion = FirebaseFirestore.instance.collection('questionsnew');
    final json = {
      'question': input2,
    };
    await docQuestion.add(json);
  }
}
