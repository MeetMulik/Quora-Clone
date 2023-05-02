import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/Drawer/AnswerScreen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  CollectionReference questions =
      FirebaseFirestore.instance.collection('questionsnew');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Questions"),
      ),
      body: StreamBuilder(
          stream: questions.snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            if (snapshot.connectionState == ConnectionState.active) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> docs = querySnapshot.docs;
              return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot document = docs[index];
                    return QuestionCard(document: document);
                  });
            }
            return Text("No data");
          }),
    );
  }
}

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key? key,
    required this.document,
  }) : super(key: key);

  final QueryDocumentSnapshot<Object?> document;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.document['question'],
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnswerScreen()));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
