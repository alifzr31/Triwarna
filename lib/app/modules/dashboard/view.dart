import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/body_dashboard.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/bottomnav_dashboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDashboard(),
      bottomNavigationBar: BottomNavDashboard(),
    );
  }
}
