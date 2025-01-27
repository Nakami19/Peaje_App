import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaje_app/common/common_index.dart';
import 'package:peaje_app/config/data_constants/data_constants.dart';
import 'package:provider/provider.dart';

class FirstLoginScreen extends StatefulWidget {
  const FirstLoginScreen({super.key});

  @override
  State<FirstLoginScreen> createState() => _FirstLoginScreenState();
}

class _FirstLoginScreenState extends State<FirstLoginScreen> {
  final storage = SecureStorageService();
  final idController = TextEditingController();
  final loginForm = GlobalKey<FormState>();

  bool login = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final userData = await storage.getValue(
        'userData',
      );

      if (userData != null) {
        setState(() {
          login = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final generalProvider = context.watch<GeneralProvider>();

    if (!login) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Inicio',
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomButton(
                      title: 'Registro',
                      paddingH: 40,
                      isPrimaryColor: false,
                      colorFilledButton: Color(0xFF4F4094),
                      isOutline: false,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DataConstants.registerScreen,
                        );
                      },
                      provider: generalProvider),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomButton(
                      title: 'Pagar',
                      paddingH: 40,
                      isPrimaryColor: false,
                      styleText: textStyle.bodyLarge!
                          .copyWith(color: Color(0xFF4F4094)),
                      colorOutlineButton: Color(0xFF4F4094),
                      isOutline: true,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DataConstants.paymentScreen,
                        );
                      },
                      provider: generalProvider),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          flexibleSpace: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric( vertical: 10,horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: (){
                        storage.deleteAll();
                        setState(() {
                          login = false;
                        });
                      },
                      child: Icon(Icons.refresh),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: loginForm,
              child: Column(
                children: [
                  Text(
                    'Iniciar Sesión',
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: idController,
                    hintText: 'Ej: 20020202',
                    paddingH: 40,
                    borderColor: Color(0xFF4F4094),
                    enabled: true,
                    label: 'Ingrese su número de cédula *',
                    inputType: TextInputType.number,
                    maxLength: 9,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo requerido';
                      }

                      if (value.contains(' ')) {
                        return 'El campo no permite espacios';
                      }

                      if (value.length > 9) {
                        return 'Máximo 9 caracteres';
                      }
                      if (value.length < 8) {
                        return 'Mínimo 8 caracteres';
                      }
                      if (RegExp(r'[-_+=(){}%!@#\$&*~.,]').hasMatch(value)) {
                        return 'No debe contener carácteres especiales';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      title: 'Siguiente',
                      isPrimaryColor: false,
                      isOutline: false,
                      onTap: () {
                        if (loginForm.currentState!.validate()){
                          Navigator.pushNamed(
                          context,
                          DataConstants.homeScreen,
                        );
                        }
                      },
                      paddingH: 40,
                      colorFilledButton:Color(0xFF4F4094) ,
                      provider: generalProvider)
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
