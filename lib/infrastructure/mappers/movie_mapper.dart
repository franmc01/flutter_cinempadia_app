import 'package:app/domain/entities/movie.dart';
import 'package:app/infrastructure/models/movie_details.dart';
import 'package:app/infrastructure/models/themoviedb_movie.dart';

class MovieMapper {
  static const String _imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String _posterPlaceholder = 'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg';
  static const String _backdropPlaceholder = 'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg';

  static String _getImageUrl(String? path, {String placeholder = _posterPlaceholder}) {
    return (path != null && path.isNotEmpty) ? '$_imageBaseUrl$path' : placeholder;
  }

  static Movie movieDbToEntity(TheMovieDbMovie moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: _getImageUrl(moviedb.backdropPath, placeholder: _backdropPlaceholder),
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage.toString(),
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: _getImageUrl(moviedb.posterPath),
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount,
  );


    static Movie movieDetailsToEntity( MovieDetails moviedb ) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '') 
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      genreIds: moviedb.genres.map((e) => e.name ).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
    );
}
