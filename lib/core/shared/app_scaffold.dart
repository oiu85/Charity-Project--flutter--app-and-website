import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  factory AppScaffold.home({
    Key? key,
    required Widget body,
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
    Color? backgroundColor,
  }) {
    return AppScaffold(
      key: key,
      body: body,
      appBar: _defaultAppBar(),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? Colors.white,
    );
  }

  factory AppScaffold.custom({
    Key? key,
    required Widget body,
    PreferredSizeWidget? appBar,
    Widget? drawer,
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
    Color? backgroundColor,
  }) {
    return AppScaffold(
      key: key,
      body: body,
      appBar: appBar ?? _defaultCustomAppBar(),
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? Colors.white,
    );
  }

  factory AppScaffold.clean({
    Key? key,
    required Widget body,
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
    Color? backgroundColor,
  }) {
    return AppScaffold(
      key: key,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? Colors.white,
    );
  }

  static PreferredSizeWidget _defaultAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        Builder(
          builder: (context) => IconButton(
            onPressed: () {
              // TODO: Navigate to notifications page when implemented
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon')),
              );
            },
            icon: Icon(
              Icons.notifications_outlined,
              size: 30.sp,
            ),
          ),
        ),
      ],
    );
  }

  static PreferredSizeWidget _defaultCustomAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_forward_outlined),
          ),
        ),
      ],
    );
  }
}
