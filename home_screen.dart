import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/mcu_model.dart';
import 'package:flutter_application_2/Models/MovieDetailScreen.dart';

import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var marvelApiUrl = "https://mcuapi.herokuapp.com/api/v1/movies";

  // We have to create a list to store data
  List<McuModels> mcuMoviesList = [];

  @override
  void initState() {
    super.initState();
    getMarvelMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: mcuMoviesList.isNotEmpty
          ? GridView.builder(
              itemCount: mcuMoviesList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                          movie: mcuMoviesList[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: mcuMoviesList[index].coverUrl.toString(),
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            mcuMoviesList[index].title ?? 'Unknown Title',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Release: ${mcuMoviesList[index].releaseDate ?? 'N/A'}',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Box Office: ${mcuMoviesList[index].boxOffice ?? 'N/A'}',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Colors.white70,
                ),
              ),
            ),
    );
  }

  void getMarvelMovies() {
    debugPrint('=========== Function running ============');
    final uri = Uri.parse(marvelApiUrl);
    http.get(uri).then((response) {
      if (response.statusCode == 200) {
        final responseBody = response.body;
        final decodedData = jsonDecode(responseBody);

        final marvelData = decodedData['data'];
        for (var i = 0; i < marvelData.length; i++) {
          // Create MCU object and add it to the list
          final mcuMovie =
              McuModels.fromJson(marvelData[i] as Map<String, dynamic>);

          // Print details to console (for debugging)
          print("id: ${mcuMovie.id}, "
              "title: ${mcuMovie.title}, "
              "releaseDate: ${mcuMovie.releaseDate}, "
              "boxOffice: ${mcuMovie.boxOffice}, "
              "duration: ${mcuMovie.duration}, "
              "overview: ${mcuMovie.overview}, "
              "coverUrl: ${mcuMovie.coverUrl}, "
              "trailerUrl: ${mcuMovie.trailerUrl}, "
              "directedBy: ${mcuMovie.directedBy}, "
              "phase: ${mcuMovie.phase}, "
              "saga: ${mcuMovie.saga}, "
              "chronology: ${mcuMovie.chronology}, "
              "postCreditScenes: ${mcuMovie.postCreditScenes}, "
              "imdbId: ${mcuMovie.imdbId}, "
              "updatedAt: ${mcuMovie.updatedAt}");

          mcuMoviesList.add(mcuMovie);
          print(mcuMoviesList.length);
        }
        setState(() {});
      } else {}
    }).catchError((err) {
      debugPrint('=========== $err ============');
    });
  }
}
