import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class PrayerEvent extends Equatable {
  const PrayerEvent();
  @override
  List<Object> get props => [];
}

class LoadPrayerEvent extends PrayerEvent {}

abstract class PrayerState extends Equatable {
  const PrayerState();
  @override
  List<Object> get props => [];
}

class PrayerInitial extends PrayerState {}

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  PrayerBloc(dynamic useCase1, [dynamic useCase2, dynamic useCase3, dynamic useCase4]) : super(PrayerInitial()) {
    on<LoadPrayerEvent>((event, emit) {});
  }
}
