import 'package:flutter/material.dart';

class SinglePost extends StatelessWidget {
  final String question = "What is the best way to learn Flutter?";
  final String answer =
      "I think the best way to learn Flutter is to build something with it. You can start with a simple app and then move on to more complex apps. You can also read the documentation and watch videos on YouTube. There are many resources available online that will help you learn Flutter. I hope this helps!";
  final String authorName = "John Doe";
  final String authorImageUrl =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  final int upvotes = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Post"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.0),
              Text(
                question,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(authorImageUrl),
                    radius: 20.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          authorName,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '$upvotes upvotes',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                answer,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
