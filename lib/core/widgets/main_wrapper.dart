import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/app_background.dart';
import 'package:weather_app/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:weather_app/features/feature_weather/presentation/screens/home_screen.dart';

import 'bottom_navigation.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget = [
      HomeScreen(),
      BookMarkScreen(),
    ];
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(
        Controller: pageController,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AppBackground.getBackGroundImage(), fit: BoxFit.cover),
        ),
        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}















// class MainWrapper extends StatefulWidget {
//   MainWrapper({super.key});

//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }

// class _MainWrapperState extends State<MainWrapper> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<HomeBloc>(context).add(LoadCwEvent("tehran"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: BlocBuilder<HomeBloc, HomeState>(
//           builder: (context, state) {
//             if (state.cwStatus is CwError) {
//               return Container(
//                 child: Center(child: Text("error.....")),
//               );
//             }
//             if (state.cwStatus is CwLoading) {
//               return Container(
//                 child: Center(child: Text("Loading.....")),
//               );
//             }

//             if (state.cwStatus is CwCompleted) {
//               CwCompleted completed = state.cwStatus as CwCompleted;

//               CurrentCityEntity cityEntity = completed.cityEntity;
//               return Container(
//                 child: Center(child: Text(cityEntity.name.toString())),
//               );
//             }

//             return Container(
//               child: Text("ajab"),
//             );
//           },
//         ));
//   }
// }
