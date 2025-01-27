import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peaje_app/common/common_index.dart';
import 'package:provider/provider.dart';

import '../../../config/data_constants/data_constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final registerForm = GlobalKey<FormState>();
  final storageService = SecureStorageService();
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final generalProvider = context.watch<GeneralProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Inicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: registerForm,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Indique los datos solicitados para el registro",
                    style: textStyle.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextFormField(
                  controller: idController,
                  hintText: 'Ej: 20020202',
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
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: nameController,
                  hintText: 'Ej: Pedro',
                  borderColor: Color(0xFF4F4094),
                  enabled: true,
                  label: 'Ingrese su nombre *',
                  maxLength: 20,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido';
                    }

                    if (value.contains(' ')) {
                      return 'El campo no permite espacios';
                    }
                    if (value.length > 20) {
                      return 'Máximo 20 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: lastNameController,
                  hintText: 'Ej: Perez',
                  borderColor: const Color(0xFF4F4094),
                  enabled: true,
                  label: 'Ingrese su apellido *',
                  maxLength: 20,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido';
                    }

                    if (value.contains(' ')) {
                      return 'El campo no permite espacios';
                    }
                    if (value.length > 20) {
                      return 'Máximo 20 caracteres';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                    title: 'Siguiente',
                    isPrimaryColor: false,
                    isOutline: false,
                    colorFilledButton: const Color(0xFF4F4094),
                    onTap: () async {
                      if (registerForm.currentState!.validate()) {
                      dynamic  data = {
                            'name': nameController.text,
                            'lastName': lastNameController.text,
                            'ci': idController.text
                          };
                        storageService.setKeyValue(
                          'userData',
                          jsonEncode(data),
                        );

                        Navigator.pushNamed(
                          context,
                          DataConstants.homeScreen,
                        );
                      }
                    },
                    provider: generalProvider),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
