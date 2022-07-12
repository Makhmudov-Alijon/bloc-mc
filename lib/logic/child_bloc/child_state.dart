part of 'child_bloc.dart';

abstract class ChildState extends Equatable {

  const ChildState();
  @override
  List<Object> get props => [];
}

class ChildDataInitialState extends ChildState {}

class ChildDataLoadingState extends ChildState {}

class ChildDataLoadedState extends ChildState {
 final CategoryChildItem apicategoryChildItem;
  const ChildDataLoadedState({
   required this.apicategoryChildItem
  });
}

class ChildDataErrorState extends ChildState {}
