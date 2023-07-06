import 'package:json_annotation/json_annotation.dart';

part 'page_view_model.g.dart';

@JsonSerializable()
class PageViewModel {
  final String title;
  final dynamic page;

  PageViewModel({
    required this.title,
    required this.page,
  });

  factory PageViewModel.fromJson(Map<String, dynamic> json) => _$PageViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageViewModelToJson(this);
}
