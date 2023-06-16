import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbr_group_task/pages/home_page/bloc/home_page_event.dart';

import '../../../api/home_page_repository/home_repository.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomeRepository _homePageReopsitory;
  final List<String> _missionsIds = ["F3364BF", "EE86F74", "CE91D46", "6C42550"];

  HomePageBloc(HomeRepository homeRepository)
      : _homePageReopsitory = homeRepository,
        super(const HomePageState()) {
    on<HomePageInitialEvent>(_onHomePageInitialEvent);
    on<HomePageChangeEvent>(_onHomePageChangeEvent);
  }

  Future<void> _onHomePageInitialEvent(HomePageInitialEvent event, Emitter emit) async {
    final mission = await _homePageReopsitory.receiveMission(missionId: _missionsIds[state.currentPageIndex]);
    emit(state.copyWith(missions: mission));
  }

  void _onHomePageChangeEvent(HomePageChangeEvent event, Emitter emit) async {
    emit(const HomePageLoadingState());
    final mission = await _homePageReopsitory.receiveMission(missionId: _missionsIds[event.pageIndex]);
    await Future.delayed(const Duration(seconds: 2));
    emit(HomePageState(currentPageIndex: event.pageIndex, missions: mission));
  }
}
