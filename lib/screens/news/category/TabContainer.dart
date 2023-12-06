import 'package:detecto_app/screens/news/category/TabItem.dart';
import 'package:flutter/material.dart';

import '../../../models/SourceResponse.dart';

class TabContainer extends StatefulWidget {
  TabContainer({required this.sourcesList});
List<Source>sourcesList;

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
 int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:widget.sourcesList.length ,
      child:Column(
        children: [
          TabBar(
            onTap: (value) {
              selectedIndex=value;
              setState(() {

              });
            },
            isScrollable: true,
           indicatorColor: Colors.transparent,
           tabs:widget.sourcesList.map((source) =>TabItem(
               isselected: selectedIndex==widget.sourcesList.indexOf(source),
               source: source)).toList()
           )
        ],
      )
    );
  }
}
