import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Column(
        children: [
          Text('dashboard'.tr),
          Row(
            children: [
              DashboardTile(title: 'current'),
              DashboardTile(title: 'total'),
            ],
          )
        ],
      ),
    ));
  }
}

class DashboardTile extends StatelessWidget {
  final String title;
  const DashboardTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeText(title),
              Row(
                children: [
                  WorldCounts(
                    name: 'old',
                    depart: 0,
                    arrived: 0,
                  ),
                  WorldCounts(
                    name: 'old',
                    depart: 0,
                    arrived: 0,
                  ),
                  WorldCounts(
                    name: 'old',
                    depart: 0,
                    arrived: 0,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class WorldCounts extends StatelessWidget {
  final String name;
  final int depart;
  final int arrived;
  const WorldCounts({super.key, required this.name, required this.depart, required this.arrived});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AutoSizeText(name),
          AutoSizeText('${'depart'.tr} $depart'),
          AutoSizeText('${'arrived'.tr} $arrived'),
        ],
      ),
    );
  }
}
