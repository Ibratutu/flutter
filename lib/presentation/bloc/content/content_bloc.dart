import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class ContentEvent extends Equatable {
  const ContentEvent();
  @override
  List<Object> get props => [];
}

class LoadContentEvent extends ContentEvent {}

abstract class ContentState extends Equatable {
  const ContentState();
  @override
  List<Object> get props => [];
}

class ContentInitial extends ContentState {}

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc(dynamic useCase1, [dynamic useCase2, dynamic useCase3, dynamic useCase4]) : super(ContentInitial()) {
    on<LoadContentEvent>((event, emit) {});
  }
}
