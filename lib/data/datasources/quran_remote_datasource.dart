import 'package:dio/dio.dart';

abstract class QuranRemoteDataSource {
  // Placeholder methods
}

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  final Dio _dio;

  QuranRemoteDataSourceImpl(this._dio);
}