import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:macbro_bloc_state/model/category_model/category_child_item.dart';
import 'package:macbro_bloc_state/repository/exam_repo.dart';

part 'child_event.dart';
part 'child_state.dart';

class ChildBloc extends Bloc<ChildEvent, ChildState> {
  final RestClient restClient;
  ChildBloc(this.restClient) : super(ChildDataInitialState()) {
    on<ChildEvent>((event, emit) async{
      if (event is LoadChildDataEvent) {
        emit(ChildDataLoadingState());
      //   NewExamMap? apiResult = (await  restClient.getGame());
      // BannersModel? apiBanner=await restClient.getBanner();
      // ExamCategoryModel2 apiCategory=await restClient.getCategory();
        CategoryChildItem apiCategoryChild=await restClient.getCategoryChildItem(event.id!);
      if (apiCategoryChild==null) {
      emit(ChildDataErrorState());

      } else {
      emit(ChildDataLoadedState(apicategoryChildItem: apiCategoryChild));
      if (state is ChildDataLoadedState) {
        event.id!=null;
      }
      print('data keldi');
      }

    }

    });
  }
}
