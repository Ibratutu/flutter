import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();
  @override
  List<Object> get props => [];
}

class LoadLibraryEvent extends LibraryEvent {}

abstract class LibraryState extends Equatable {
  const LibraryState();
  @override
  List<Object> get props => [];
}

class LibraryInitial extends LibraryState {}

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc(dynamic useCase1, [dynamic useCase2, dynamic useCase3, dynamic useCase4]) : super(LibraryInitial()) {
    on<LoadLibraryEvent>((event, emit) {});
  }
}
