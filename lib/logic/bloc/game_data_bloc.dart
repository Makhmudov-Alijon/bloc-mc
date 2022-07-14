import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:macbro_bloc_state/model/banner_model/banners_model.dart';
import 'package:macbro_bloc_state/model/category_model/ExamCategoryModel2.dart';
import 'package:macbro_bloc_state/model/new_exam/new_exam_map.dart';

import 'package:macbro_bloc_state/repository/exam_repo.dart';


part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {

  final RestClient restClient;
  // final GamesRepo gamesRepo;
  GameDataBloc(
      this.restClient,
  ) : super(GameDataInitialState()) {
    on<GameDataEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameDataLoadingState());
        List<BannersModel> bannerlist=[];
        NewExamMap? apiResult = (await  restClient.getGame());
        BannersModel? apiBanner=await restClient.getBanner();
        ExamCategoryModel2 apiCategory=await restClient.getCategory();
        if (apiResult == null || apiBanner ==null ||apiCategory==null) {
          emit(GameDataErrorState());
        } else {
          bannerlist.add(apiBanner);
          emit(GameDataLoadedState(apiResult: apiResult,apiBanner: apiBanner,apiCategory: apiCategory));
          print('data keldi');
        }
      }
    });
  }
}
