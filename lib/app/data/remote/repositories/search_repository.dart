import 'package:dio/dio.dart';
import 'package:jobs_flutter_app/app/data/remote/base/isearch_repository.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/search/search_out_dto.dart';

import '../base/iservice.dart';
import '../exceptions/dio_exceptions.dart';

class SearchRepository extends ISearchRepository<SearchOutDto> {
  final IService service;

  SearchRepository({required this.service});

  @override
  Future<State<List<SearchOutDto>>> getAll(
      {int? limit, int? offset, String? q}) async {
    try {
      final response = await service.getAll(limit: limit, offset: offset, q: q);
      final results =
          (response.data as List).map((e) => SearchOutDto.fromJson(e)).toList();
      if (response.statusCode == 200) return State.success(data: results);
      return const State.failure(reason: "Some thing wrong happen!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return State.failure(reason: errMsg);
    }
  }
}
