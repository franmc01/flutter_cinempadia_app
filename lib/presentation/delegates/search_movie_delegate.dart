import 'package:animate_do/animate_do.dart';
import 'package:app/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({ required this.searchMovies });

  @override
  String? get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: 
          IconButton(onPressed: (){
            query = '';
          }, icon: Icon(Icons.clear_outlined))
        ,
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back_ios_new_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    return  Text('Build Result');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      // initialData: [],
      future: searchMovies(query), 
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];


      return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

            return ListTile(title: Text(movie.title));
        },
      );
    });
  }
  
}