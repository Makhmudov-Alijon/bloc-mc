
import 'package:dio/dio.dart';

import 'package:macbro_bloc_state/model/banner_model/banners_model.dart';
import 'package:macbro_bloc_state/model/category_model/ExamCategoryModel2.dart';
import 'package:macbro_bloc_state/model/category_model/category_child_item.dart';

import 'package:macbro_bloc_state/model/new_exam/new_exam_map.dart';
import 'package:macbro_bloc_state/model/product_model/product_model.dart';

import 'package:retrofit/http.dart';

part 'exam_repo.g.dart';

@RestApi(baseUrl: 'https://api.client.macbro.uz')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/v1/featured-list/rasprodazha')
  Future<NewExamMap> getGame();

  @GET('/v1/banner')
  Future<BannersModel> getBanner();

  @GET('/v1/category')
  Future<ExamCategoryModel2> getCategory();

  @GET('/v1/product?category={id}')
  Future<CategoryChildItem> getCategoryChildItem(@Path("id") String id);

  @GET('/v1/product/{id}')
  Future<ProductModel> getProductId(
      @Path("id") String id,
      );
}
