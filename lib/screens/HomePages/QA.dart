import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/HomePages/SinglePost.dart';

class QuestionAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [QACard(), QACard(), QACard()],
      ),
    );
  }
}

class QACard extends StatelessWidget {
  final String question = "What is the best way to learn Flutter?";
  final int answerCount = 5;
  final List<String> topics = ["Flutter", "Dart", "Mobile Development"];
  final String answerParagraph =
      "I think the best way to learn Flutter is to build something with it. You can start with a simple app and then move on to more complex apps. You can also read the documentation and watch videos on YouTube. There are many resources available online that will help you learn Flutter. I hope this helps!";
  final String thumbnailUrl =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                thumbnailUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          thumbnailUrl,
                          width: 64.0,
                          height: 64.0,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(width: 64.0, height: 64.0),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        question,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        answerParagraph,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  child: Text(
                    "Read",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SinglePost()));
                  },
                ),
                Wrap(
                  spacing: 8.0,
                  children: topics.map((topic) {
                    return Chip(
                      label: Text(topic),
                      backgroundColor: Colors.grey[300],
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
