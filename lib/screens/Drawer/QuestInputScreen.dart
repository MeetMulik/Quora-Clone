import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestInputScreen extends StatefulWidget {
  const QuestInputScreen({super.key});

  @override
  State<QuestInputScreen> createState() => _QuestInputScreenState();
}

class _QuestInputScreenState extends State<QuestInputScreen> {
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
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
              controller: _controller2,
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
                  String input2 = _controller2.text;
                  String input3 = _controller3.text;
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
}
