import 'package:demo_front/model/cat.dart';
import 'package:demo_front/model/paging_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_api.g.dart';

@RestApi()
abstract class CatApi {
  factory CatApi(
    Dio dio, {
    String baseUrl,
  }) = _CatApi;

  @GET('/cats')
  Future<PagingData<Cat>> getCats({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
  });

  @GET('/cats/{id}')
  Future<Cat> getCat(@Path('id') int id);

  @POST('/cats')
  Future<void> addCat(@Body() Cat cat);

  @PUT('/cats/{id}')
  Future<void> updateCat(
    @Path('id') int id,
    @Body() Cat cat,
  );

  @DELETE('/cats/{id}')
  Future<void> deleteCat(@Path('id') int id);
}
