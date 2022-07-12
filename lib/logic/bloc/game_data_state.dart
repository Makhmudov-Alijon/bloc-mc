

part of 'game_data_bloc.dart';

abstract class GameDataState extends Equatable {
  const GameDataState();

  @override
  List<Object> get props => [];
}

class GameDataInitialState extends GameDataState {}

class GameDataLoadingState extends GameDataState {}

class GameDataLoadedState extends GameDataState {
  final NewExamMap apiResult;
  final BannersModel apiBanner;
  final ExamCategoryModel2 apiCategory;
  const GameDataLoadedState({
    required this.apiResult,
    required this.apiBanner,
    required this.apiCategory
  });
}

class GameDataErrorState extends GameDataState {}
