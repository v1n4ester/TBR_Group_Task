// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:tbr_group_task/api/home_page_repository/models/missions.dart';

class HomePageState extends Equatable {
  final int currentPageIndex;
  final Missions missions;

  const HomePageState({
    this.currentPageIndex = 0,
    this.missions = const Missions(missionName: "", missionId: "", manufacturers: [""], payloadIds: [""], wikipedia: "", website: "", twitter: "", description: ""),
  });

  @override
  List<Object?> get props => [currentPageIndex, missions];

  HomePageState copyWith({
    int? currentPageIndex,
    Missions? missions,
  }) {
    return HomePageState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      missions: missions ?? this.missions,
    );
  }
}

class HomePageLoadingState extends HomePageState {
  const HomePageLoadingState();
}