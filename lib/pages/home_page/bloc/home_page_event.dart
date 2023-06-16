import 'package:equatable/equatable.dart';

class HomePageEvent extends Equatable {
  const HomePageEvent();
  @override
  List<Object?> get props => [];
}

class HomePageInitialEvent extends HomePageEvent {
  const HomePageInitialEvent();
}

class HomePageChangeEvent extends HomePageEvent {
  final int pageIndex;
  const HomePageChangeEvent(this.pageIndex);
}