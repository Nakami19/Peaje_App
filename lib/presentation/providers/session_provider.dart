import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:peaje_app/app.dart';
import 'package:peaje_app/common/common_index.dart';

class SessionProvider extends GeneralProvider{

  final storage = SecureStorageService();
  final normalStorage = StorageService();

  String? personName = '';
  String? personLastName = '';
   String? personId = '';

    //Se obtienen los datos del usuario para mostrar en pantalla
  Future<void> getUserinfo() async {
    try {
      super.setLoadingStatus(true);

    //Se obtienen los datos desde el storage
      final userData = await storage.getValue(
        'userData',
      );


      // Valido que no sea null
      if (userData != null) {
        final decodedData = jsonDecode(userData);

      //Se inicializan las variables
        personName = decodedData['name'];
        personLastName = decodedData['lastName'];
        personId = decodedData['id'];

       

        final userCompleteNameJson = jsonEncode({
          'personName': decodedData['name'],
          'personLastName': decodedData['lastName']
        });

        // Nombre completo del usuario
        var encodedUserData =
            await normalStorage.getValue<String>('userCompleteName');

        // Veo si la biometría está habilitada
        var enabledBiometricValue =
            await normalStorage.getValue<String>('enabledBiometric');

        final enabledBiometric = enabledBiometricValue == "true" ? true : false;

        // Solo guardo si no hay un nombre guardado anteriormente
        if (encodedUserData == '' ||
            encodedUserData == null && enabledBiometric == true) {
          // Aqui guardo esta variable en el ls
          normalStorage.setKeyValue<String>(
            'userCompleteName',
            userCompleteNameJson,
          );
        }
      }

      notifyListeners();


    } on DioError catch (error) {
      final response = error.response;
      // final data = error.response?.data as Map<String, dynamic>;
      super.setStatusCode(response!.statusCode!);

      // Obtengo igualmente los datos del usuario
      // final userData = await storage.getValue(
      //   'userData',
      // );

      // final decodedData = jsonDecode(userData!);

      super.setErrors(true);
      super.setErrorMessage(error.message??"");
      super.setTrackingCode(error.toString());

      Snackbars.customSnackbar(navigatorKey.currentContext!,
          title: error.toString(), message: "");
    } finally {
      super.setLoadingStatus(false);
    }

    notifyListeners();

  }

}