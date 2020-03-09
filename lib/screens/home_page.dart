import 'package:about_film/models/popular/popular_page_model.dart';
import 'package:about_film/services/network_services/network_service.dart';
import 'package:about_film/widgets/popularPageListOfItems.dart';
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
              return Container(
                height: 300,
                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${snapshot.data.results[0].poster_path}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: 170,
                            child: Text(
                              '${snapshot.data.results[0].title}',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 0.7),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Color.fromRGBO(255, 223, 0,
                                    snapshot.data.results[0].vote_average / 10),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${snapshot.data.results[0].vote_average}',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                '/10',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    letterSpacing: 0.5),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '${snapshot.data.results[0].vote_count} votes',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                letterSpacing: 0.5),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
//                PopularListOfItems(snapshot.data.results);
            else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
