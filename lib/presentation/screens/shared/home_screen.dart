import 'package:flutter/material.dart';
import 'package:peaje_app/presentation/providers/session_provider.dart';
import 'package:peaje_app/presentation/widgets/custom_app_appbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final sessionProvider = context.read<SessionProvider>();
      await sessionProvider.getUserinfo();
    });
  }

  List<Map<String, dynamic>> vehicles = [{}];

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(65), child: CustomAppAppbar()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  'lib/assets/peaje.svg',
                  height: 250,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
