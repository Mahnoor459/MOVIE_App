import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_2/Models/mcu_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final McuModels movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? 'Movie Details'),
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: movie.coverUrl ?? '',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              movie.title ?? 'Unknown Title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Release Date: ${movie.releaseDate ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Box Office: ${movie.boxOffice ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Duration: ${movie.duration ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Overview:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              movie.overview ?? 'No Overview Available',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Directed By: ${movie.directedBy ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Phase: ${movie.phase ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Saga: ${movie.saga ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Chronology: ${movie.chronology ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Post Credit Scenes: ${movie.postCreditScenes ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'IMDb ID: ${movie.imdbId ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Last Updated: ${movie.updatedAt ?? 'N/A'}',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
