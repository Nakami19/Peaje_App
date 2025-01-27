import 'package:flutter/material.dart';
import 'package:peaje_app/common/common_index.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({super.key});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Volver'),
        ),
        body: CustomWebview(args: 'https://business.pagochinchin.com/auth/login',height: MediaQuery.of(context).size.height,),);
  }
}
