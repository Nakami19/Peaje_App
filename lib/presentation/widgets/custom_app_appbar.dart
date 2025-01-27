import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/common_index.dart';
import '../../config/data_constants/data_constants.dart';
import '../providers/session_provider.dart';

class CustomAppAppbar extends StatefulWidget {
  const CustomAppAppbar({super.key});

  @override
  State<CustomAppAppbar> createState() => _CustomAppAppbarState();
}

class _CustomAppAppbarState extends State<CustomAppAppbar> {
  @override
  Widget build(BuildContext context) {
    final sessionProvider = context.watch<SessionProvider>();
    final textStyle = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Color(0xFFD8DDEF),
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        children: [
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                          builder: (context) => Dialogs.customDialog(context,
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
    );
  }
}
