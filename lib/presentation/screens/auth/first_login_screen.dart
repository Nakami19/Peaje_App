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
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final generalProvider = context.watch<GeneralProvider>();
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
                    styleText:
                        textStyle.bodyLarge!.copyWith(color: Color(0xFF4F4094)),
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
  }
}
