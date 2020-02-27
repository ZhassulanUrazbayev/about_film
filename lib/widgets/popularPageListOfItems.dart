import 'package:about_film/models/popular/popular_page_model.dart';
import 'package:flutter/material.dart';

class PopularListOfItems extends StatelessWidget {
  final List<Results> listOfItems;

  const PopularListOfItems(List<Results> results, {
    Key key,
    this.listOfItems,
    this.child,
  }) : super(key: key);

  final Widget child;

  get results => results;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          "https://image.tmdb.org/t/p/w500${listOfItems[index].poster_path}",
          height: 100,
          width: 100,
        );
      },
    );;
  }
}
