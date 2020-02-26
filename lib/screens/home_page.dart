import 'package:about_film/models/popular/popular_page_model.dart';
import 'package:about_film/services/network_services/network_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder<Popular>(
          future: getPopularPage(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Text(
                'Title from Post JSON : ${snapshot.data.results[0].title}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0),
              );
            else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
