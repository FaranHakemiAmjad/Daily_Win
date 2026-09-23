import 'package:daily_win/app/router/app_routes.dart';
import 'package:daily_win/features/auth/presentation/providers/sign_out_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/day_widgets.dart';
import '../widgets/habit_card.dart';
import '../widgets/temps_widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  // Future<void> logOut() async {
  //   await ref.read(signOutProvider.notifier).signOut();
  //
  //   final state = ref.read(signOutProvider);
  //
  //   state.whenOrNull(
  //     data: (_) {
  //       context.go(AppRoutes.splash);
  //     },
  //     error: (_,_) => null
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 239.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: BorderDirectional(bottom: BorderSide(color: Colors.black12))
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        homeTopPlaceHolder(),
                        homeTopPlaceHolder(),
                      ],
                    ),
                    Row(
                      spacing: Checkbox.width,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello User!!", style: TextStyle(color: Colors.black),),
                            Text("Let's get down into business.", style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        homeTopPlaceHolder(),
                      ],
                    ),
                    Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    )
                  ],
                ),
            ),
          ),
          DayList(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
                itemBuilder: (context, index) {
                return card();
                }
                ),
          ),
        ],
      ),
    );
  }
}