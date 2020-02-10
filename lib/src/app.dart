import 'package:flutter/material.dart';
import 'package:news/src/screens/news_list.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {

  Widget build(context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Hacker News',
        home: NewsList()
      ),
    );
    
  }
}