import '../../domain/entities/on_boarding_entity.dart';

class OnBoardingModel extends OnBoardingEntity {
  const OnBoardingModel({
    required super.imagePath,
    required super.title,
    required super.subTitle,
  });

  factory OnBoardingModel.fromEntity(OnBoardingEntity entity) {
    return OnBoardingModel(
      imagePath: entity.imagePath,
      title: entity.title,
      subTitle: entity.subTitle,
    );
  }
}
