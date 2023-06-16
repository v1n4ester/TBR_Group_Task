import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbr_group_task/pages/home_page/bloc/home_page_bloc.dart';
import 'package:tbr_group_task/pages/home_page/bloc/home_page_state.dart';
import 'package:tbr_group_task/utils/constants.dart';

class MissionsListView extends StatelessWidget {
  const MissionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        final state = context.watch<HomePageBloc>().state;
        if (state is HomePageLoadingState) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(color: Colors.lightGreen),
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.missions.payloadIds.length,
            itemBuilder: (context, index) => Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Constants.kDefaultBorderRadius),
                  color: Colors.grey.shade900),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(
                  horizontal: Constants.kDefaultGap, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Constants.rocketStartDate,
                            style: TextStyle(color: Colors.lightGreenAccent)),
                        SizedBox(height: 3),
                        Text(Constants.rocketStartTime, style: TextStyle(color: Colors.grey)),
                      ]),
                  const SizedBox(width: Constants.kDefaultGap),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(state.missions.missionName,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white)),
                        const SizedBox(height: 3),
                        Expanded(
                          child: Text(state.missions.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
