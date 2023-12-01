import 'package:detecto_app/screens/home/custom-row.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar: AppBar(title: Text('Detecto')),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height:height*.01 ,),
            Text('Welcome!',
                style:Theme.of(context).textTheme.bodyLarge!
            .copyWith(color: Colors.orange,fontSize:38 )),
            SizedBox(height:height*.001 ,),
            Text('please select one...',
                style:Theme.of(context).textTheme.bodyLarge!
                    .copyWith(color: Colors.orange,fontSize:32 )),
            SizedBox(height:height*.07 ,),
            CustomRow(text: 'SuperMarket',),
            CustomRow(text: 'Object  detection',),
            CustomRow(text: 'News',)
          ],
        ),
      ),
    );
  }
}
