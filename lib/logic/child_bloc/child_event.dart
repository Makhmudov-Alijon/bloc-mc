part of 'child_bloc.dart';

abstract class ChildEvent extends Equatable {
   final String? id;
  const ChildEvent(this.id);
  @override
  List<Object> get props => [];
}
class LoadChildDataEvent extends ChildEvent {
  LoadChildDataEvent(super.id);
}