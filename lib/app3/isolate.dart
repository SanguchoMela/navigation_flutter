import 'package:flutter/material.dart';

import 'data_transfer_page.dart';
import 'infinite_process_page.dart';
import 'performance_page.dart';

class IsolatePage extends StatelessWidget {
  const IsolatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.flash_on),
                  text: 'Performance',
                ),
                Tab(
                  icon: Icon(Icons.sync),
                  text: 'Infinite Process',
                ),
                Tab(
                  icon: Icon(Icons.storage),
                  text: 'Data Transfer',
                ),
              ],
            ),
            title: const Text('Isolate Example'),
          ),
          body: const TabBarView(
            children: [
              PerformancePage(),
              InfiniteProcessPageStarter(),
              DataTransferPageStarter(),
            ],
          ),
        ),
      ),
    );
  }
}
