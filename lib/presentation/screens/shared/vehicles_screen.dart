import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peaje_app/presentation/widgets/custom_app_appbar.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  @override
  Widget build(BuildContext context) {
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
