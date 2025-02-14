import 'package:app/domain/entities/movie.dart';
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
}
