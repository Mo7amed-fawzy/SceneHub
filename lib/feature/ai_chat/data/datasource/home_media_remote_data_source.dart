// // home_media_remote_data_source.dart
// import 'package:ai_movie_app/core/network/api_consumer.dart';
// import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';
// import '../models/home_movies_details_model.dart';
// import '../constants/endpoint_constants.dart';
// import '../constants/cache_keys.dart';
// import '../utils/api_keys.dart';

// abstract class HomeMediaRemoteDataSource {
//   Future<List<HomeMoviesDetailsModel>> getNowPlaying({
//     required String mediaType,
//   });
//   Future<List<HomeMoviesDetailsModel>> getMixedNowPlaying();
//   Future<HomeMoviesDetailsModel> getDetails({
//     required int id,
//     required String mediaType,
//   });
// }

// class HomeMediaRemoteDataSourceImpl implements HomeMediaRemoteDataSource {
//   final ApiConsumer apiConsumer;

//   HomeMediaRemoteDataSourceImpl({required this.apiConsumer});

//   @override
//   Future<HomeMoviesDetailsModel> getDetails({
//     required int id,
//     required String mediaType,
//   }) async {
//     final type = mediaType.toLowerCase();
//     final endpoint = type == "movie"
//         ? "${EndpointConstants.movie}$id"
//         : "${EndpointConstants.tv}$id";

//     final response = await apiConsumer.get(
//       endpoint,
//       queryParameters: {CacheKeys.apiKey: EnvConfig.tmdbApiKey},
//     );

//     if (response == null) throw Exception('Failed to load details');

//     return HomeMoviesDetailsModel.fromJson(response, mediaType: type);
//   }

//   @override
//   Future<List<HomeMoviesDetailsModel>> getNowPlaying({
//     required String mediaType,
//   }) async {
//     final type = mediaType.toLowerCase();
//     final endpoint = type == "movie"
//         ? EndpointConstants.nowPlayingMovies
//         : EndpointConstants.airingTodayTv;

//     final response = await apiConsumer.get(
//       endpoint,
//       queryParameters: {CacheKeys.apiKey: EnvConfig.tmdbApiKey},
//     );

//     if (response == null || response[CacheKeys.results] == null) return [];

//     final results = response[CacheKeys.results] as List;

//     return results
//         .map((json) => HomeMoviesDetailsModel.fromJson(json, mediaType: type))
//         .where((item) => item.id != null)
//         .toList();
//   }

//   @override
//   Future<List<HomeMoviesDetailsModel>> getMixedNowPlaying() async {
//     final results = await Future.wait([
//       getNowPlaying(mediaType: "movie"),
//       getNowPlaying(mediaType: "tv"),
//     ]);

//     final mixed = [...results[0], ...results[1]];
//     mixed.shuffle();
//     return mixed.where((item) => item.id != null).toList();
//   }
// }
