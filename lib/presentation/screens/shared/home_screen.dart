import 'package:flutter/material.dart';
import 'package:peaje_app/common/common_index.dart';
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

  List<Map<String, dynamic>> vehicles = [
    {
      'plate': 'ABC123',
      'alias': 'Spark amarillo',
      'balance': '100 Bs',
    },
    {
      'plate': 'XYZ456',
      'alias': 'Corolla gris',
      'balance': '150 Bs',
    },
    {
      'plate': 'DEF789',
      'alias': 'Hilux negra',
      'balance': '200 Bs',
    },
    {
      'plate': 'GHI321',
      'alias': 'Yaris rojo',
      'balance': '120 Bs',
    },
    {
      'plate': 'JKL654',
      'alias': 'Civic azul',
      'balance': '180 Bs',
    },
    {
      'plate': 'MNO987',
      'alias': 'CR-V blanca',
      'balance': '75 Bs',
    },
    {
      'plate': 'PQR159',
      'alias': 'D-Max plateada',
      'balance': '90 Bs',
    },
    {
      'plate': 'STU753',
      'alias': 'F-150 negra',
      'balance': '300 Bs',
    },
    {
      'plate': 'VWX951',
      'alias': 'Tacoma verde',
      'balance': '110 Bs',
    },
    {
      'plate': 'YZA852',
      'alias': 'Land Cruiser marrón',
      'balance': '250 Bs',
    },
    {
      'plate': 'BCD741',
      'alias': 'Spark blanco',
      'balance': '60 Bs',
    },
  ];

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Text('Vehículos registrados', style: textStyle.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: ListView.builder(
                      itemCount: vehicles.length,
                      itemBuilder: (context, index) {
                        final vehicle = vehicles[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          child: TextCard(
                            texts: buildTextsFromVehicles(
                                vehicle,
                                statusColors), // Lista con los textos generada
                            onTap: () {
                            
                            },
                          ),
                        );
                      }),
                ),
              ),

              Text('Historial de movimientos', style: textStyle.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),

              const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> buildTextsFromVehicles(
      Map<String, dynamic> vehicle, Map<String, Color> statusColors) {
    List<Map<String, dynamic>> objects = [];

    if (vehicle['plate'] != null) {
      objects.add({'label': 'Nro. placa: ', 'value': vehicle['plate']});
    }

    if (vehicle['alias'] != null) {
      objects.add({'label': 'Alias: ', 'value': vehicle['alias']});
    }

     if (vehicle['balance'] != null) {
      objects.add({'label': 'Balance: ', 'value': vehicle['balance']});
    }

    objects.add({
      'label': 'status',
      'value': 'Recargar',
      'statusColor': Color(0xFF568259)
    });
   
    return objects;
  }
}
