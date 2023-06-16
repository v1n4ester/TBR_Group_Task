import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbr_group_task/api/home_page_repository/home_repository.dart';
import 'package:tbr_group_task/pages/home_page/bloc/home_page_bloc.dart';
import 'package:tbr_group_task/pages/home_page/bloc/home_page_event.dart';
import 'package:tbr_group_task/pages/home_page/view/home_page_page_view.dart';
import 'package:tbr_group_task/pages/home_page/view/missions_list_view.dart';
import 'package:tbr_group_task/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.homeAddpbarTitle),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) =>
            HomePageBloc(HomeRepository())..add(const HomePageInitialEvent()),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Constants.kDefaultGap),
            HomePagePageView(),
            SizedBox(height: Constants.kDefaultGap),
            Padding(
              padding: EdgeInsets.only(left: Constants.kDefaultGap),
              child: Text(Constants.missionsCaption,
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            SizedBox(height: 20),
            MissionsListView()
          ],
        ),
      ),
    );
  }
}
