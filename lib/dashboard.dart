import 'package:flutter/material.dart';

import 'add_campaign.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900], title: Text('Available campaigns'),
        bottom: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab (text: 'All compaigns',),
            Tab (text: 'My campaigns',),
          ],
        ),),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.grey[900],
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCampaign()));
          }, icon: Icon(Icons.add),label: Text('Add new')),
      body:
      TabBarView(
          controller: controller,
          children: <Widget>[

          ])
      ,
    );
  }
}
