import 'package:movies/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({required super.id, super.backdropPath});
  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
        id: json["id"],
        backdropPath: json["backdrop_path"] ??
            "https://clipart-library.com/data_images/208821.png",
      );
}
