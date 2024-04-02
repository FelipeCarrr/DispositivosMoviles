import 'package:flutter/material.dart';

class RecetaScreen extends StatelessWidget {
  const RecetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.ad_units)),
            Tab(icon: Icon(Icons.account_balance_wallet_rounded)),
            Tab(icon: Icon(Icons.add_home_work_sharp)),
          ],
        ),
        body: TabBarView(children: [
          Icon(Icons.abc),
          Icon(Icons.account_balance_wallet_rounded),
          Icon(Icons.add_home_work_sharp),
        ]),
      ),
    );
  }
}
