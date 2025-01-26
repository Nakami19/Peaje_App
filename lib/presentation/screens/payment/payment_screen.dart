import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaje_app/common/common_index.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final plateController = TextEditingController();
  final plateForm = GlobalKey<FormState>();
  bool _isInfoVisible = false;
  @override
  Widget build(BuildContext context) {
    final generalProvider = context.watch<GeneralProvider>();
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Volver'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: plateForm,
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextFormField(
                  controller: plateController,
                  hintText: 'Ej: AB123CD',
                  enabled: true,
                  label: 'Ingrese la placa del vehículo *',
                  maxLength: 6,
                  onChanged: (value) {
                    if (_isInfoVisible) {
                      setState(() {
                        _isInfoVisible = !_isInfoVisible;
                      });
                    }
                  },
                  borderColor: Color(0xFF4F4094),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido';
                    }

                    if (value.contains(' ')) {
                      return 'El campo no permite espacios';
                    }
                    if (value.length!=6) {
                      return 'La placa debe tener 6 carácteres';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: 'Siguiente',
                  isPrimaryColor: false,
                  isOutline: false,
                  colorFilledButton: Color(0xFF4F4094),
                  onTap: () {
                    if (plateForm.currentState!.validate()) {
                      setState(() {
                        _isInfoVisible = !_isInfoVisible;
                      });
                    }
                  },
                  provider: generalProvider),
              const SizedBox(
                height: 50,
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: _isInfoVisible
                    ? Column(
                        children: [
                          Text(
                            'Balance de vehículo ${plateController.text}',
                            style: GoogleFonts.lato(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '100,00 Bs',
                            style: textStyle.bodyLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              paddingH: 30,
                              title: 'Recargar',
                              isPrimaryColor: false,
                              isOutline: false,
                              colorFilledButton: Color(0xFF4F4094),
                              onTap: () {},
                              provider: generalProvider),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
