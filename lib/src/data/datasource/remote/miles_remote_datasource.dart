import 'package:miles_education/src/data/models/feed/feed_model.dart';
import 'package:miles_education/src/data/models/testimonials/testimonials_model.dart';

import '../../../core/api_client.dart';

abstract class MilesRemoteDatasource {
  Future<FeedModel> getFeeds({required Map<String, dynamic> params});
  Future<TestimonialsModel> getTestimonials({required Map<String, dynamic> params});
}

class AVRemoteDataSourceImpl extends MilesRemoteDatasource {
  final ApiClient _client;

  AVRemoteDataSourceImpl(this._client);

  @override
  Future<FeedModel> getFeeds({required Map<String, dynamic> params}) async {
    final response = await _client.get('cfa60c8b-5c47-415e-a8a8-457eed3190ff/home_page.json', params: params);
    return FeedModel.fromJson(response);
  }

  @override
  Future<TestimonialsModel> getTestimonials({required Map<String, dynamic> params}) async {
    final response = await _client.get('846b7db1-ffc4-4fb8-be96-879d160f228b/testimonials.json', params: params);
    return TestimonialsModel.fromJson(response);
  }

}