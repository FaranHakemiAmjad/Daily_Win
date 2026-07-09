import 'package:daily_win/app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                context.push(AppRoutes.login);
              },
              label: Text('Continue with E-Mail'),
              icon: Icon(Icons.exit_to_app),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Apple'),
                  icon: Icon(Icons.apple, color: Colors.black),
                ),
                ElevatedButton.icon(onPressed: () {}, label: Text('Google'), icon: Icon(Icons.g_mobiledata),),

                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Facebook',),
                  icon: Icon(
                    Icons.facebook,
                    color: Color.fromARGB(255, 56, 67, 255),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Center(
              child: Text(
                'By continuing you agree Terms of Service & Privacy Policy',
                style: TextStyle(fontSize: 10.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
