import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbr_group_task/pages/home_page/bloc/home_page_bloc.dart';
import 'package:tbr_group_task/pages/home_page/bloc/home_page_state.dart';

import '../../../utils/constants.dart';
import '../bloc/home_page_event.dart';

class HomePagePageView extends StatefulWidget {
  const HomePagePageView({super.key});

  @override
  State<HomePagePageView> createState() => _HomePagePageViewState();
}

class _HomePagePageViewState extends State<HomePagePageView> {
  final PageController _pageController =
      PageController(viewportFraction: Constants.kDefaultViewportFractin);
  final List<String> _images = [
    "assets/icons/falcon_1.jpg",
    "assets/icons/falcon_9.jpg",
    "assets/icons/falcon_heavy.jpg",
    "assets/icons/bfr_moon.jpg",
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) => Column(
              children: [
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() => _index = index);
                      context
                          .read<HomePageBloc>()
                          .add(HomePageChangeEvent(index));
                    },
                    itemCount: _images.length,
                    itemBuilder: (context, currentIndex) {
                      return Transform.scale(
                        scale: currentIndex == _index ? 1 : 0.93,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Constants.kDefaultBorderRadius),
                                image: DecorationImage(
                                    image: AssetImage(_images[currentIndex]),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      _images.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade50),
                                    shape: BoxShape.circle),
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor: _index == index
                                      ? Colors.grey.shade50
                                      : Colors.transparent,
                                ),
                              ),
                            ),
                          )),
                )
              ],
            ));
  }
}
