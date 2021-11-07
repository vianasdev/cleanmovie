import 'dart:convert';

import 'package:cleanmovie/features/domain/entities/movie_entity.dart';
import 'package:dio/dio.dart';

import 'api_remote_data_source.dart';

class ApiRemoteDataSourceImpl extends ApiRemoteDataSource {
  final String apiKey = '5f48542f466b4925764cd9af170b2ce8';
  final Dio dio;

  ApiRemoteDataSourceImpl({required this.dio});

  @override
  Stream<MovieEntity> getMovies() async* {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&page=1'
    );

    final results = MovieEntity.fromJson(json.decode(response.toString()));
    yield results;
  }
}