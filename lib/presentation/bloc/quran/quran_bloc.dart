import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();
  @override
  List<Object> get props => [];
}

class LoadQuranEvent extends QuranEvent {}

abstract class QuranState extends Equatable {
  const QuranState();
  @override
  List<Object> get props => [];
}

class QuranInitial extends QuranState {}

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc(dynamic useCase1, [dynamic useCase2, dynamic useCase3, dynamic useCase4]) : super(QuranInitial()) {
    on<LoadQuranEvent>((event, emit) {});
  }
}
