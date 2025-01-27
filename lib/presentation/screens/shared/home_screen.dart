import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaje_app/config/data_constants/data_constants.dart';
import 'package:peaje_app/presentation/providers/session_provider.dart';
import 'package:provider/provider.dart';
import '../../../common/common_index.dart';
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

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final sessionProvider = context.watch<SessionProvider>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFD8DDEF),
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            children: [
              SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hola! ${sessionProvider.personName} ${sessionProvider.personLastName}',
                        style: textStyle.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => Dialogs.customDialog(
                                      context,
                                      title: 'Cerrar sesión', closeAction: () {
                                    Navigator.pop(context);
                                  }, actionSuccess: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      DataConstants.firstLoginScreen,
                                      (route) => false,
                                    );

                                    Snackbars.customSnackbar(
                                      context,
                                      title: '¡Vuelva Pronto!',
                                      message:
                                          'Su sesión ha sido cerrada exitosamente.',
                                    );
                                  }));
                        },
                        child: Icon(
                          Icons.logout,
                          size: 22,
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
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
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadiusValue),
              topRight: Radius.circular(borderRadiusValue),
            ),
            border: Border(
              top: BorderSide(
                color: Color.fromARGB(
                    255, 209, 206, 206), // Color del borde superior
                width: 3.0, // Grosor del borde
              ),
            ),
          ),
          margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(borderRadiusValue),
              topRight: Radius.circular(borderRadiusValue),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 7, top: 3), // Para ajustar la altura
              child: NavigationBar(
                height: 46,
                indicatorColor: Colors.transparent,
                indicatorShape: const CircleBorder(eccentricity: 0.2),
                onDestinationSelected: (index) {},
                backgroundColor: Colors.white,
                destinations: [
                  //Opciones del nav bar
                  NavigationDestination(
                    icon: Icon(
                      CupertinoIcons.house,
                      color: checkBoxColor,
                    ),
                    selectedIcon: const Icon(
                      CupertinoIcons.house_fill,
                      color: darkColor,
                    ),
                    label: 'Home',
                  ),

                  NavigationDestination(
                    icon: Icon(
                      CupertinoIcons.person,
                      color: checkBoxColor,
                    ),
                    selectedIcon: const Icon(CupertinoIcons.person_fill,
                        color: darkColor),
                    label: 'Perfil',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
