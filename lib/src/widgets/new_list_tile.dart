import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'dart:async';
import '../blocs/stories_provider.dart';
import 'loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;
  NewsListTile({this.itemId});
  
  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if(!snapshot.hasData) {
          return LoadingContainer();
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context,AsyncSnapshot<ItemModel> itemSnapShot) {
            if(!itemSnapShot.hasData) {
              return LoadingContainer();
            }
            return buildTile(context,itemSnapShot.data);
          }
        );

      },
    );
  }

  Widget buildTile(BuildContext context, ItemModel  item) {
    return Column(
      children: [
         ListTile(
          title: Text(item.title),
          onTap: () {
            Navigator.pushNamed(context, '/${item.id}');
          },
          subtitle: Text('${item.score} points'),
          trailing: Column(
            children: [
              Icon(Icons.comment),
              Text('${item.descendants}')
            ]
          )
        ),
        Divider(
          height: 7.0,
        )
      ]
    );
  }
}