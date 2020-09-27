import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecommerce01/colors.dart';
import 'package:ecommerce01/constants.dart';
import 'package:flutter/material.dart';

class Ecommerce01Phone extends StatefulWidget {
  @override
  _Ecommerce01PhoneState createState() => _Ecommerce01PhoneState();
}

class _Ecommerce01PhoneState extends State<Ecommerce01Phone> {
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBackground,
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: Column(
          children: [
            Text("I need your phone number to identify you."),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: CountryCodePicker(
                        initialSelection: '+263',
                        favorite: ['+263', 'ZW'],
                        textStyle: TextStyle(color: Colors.orange[900]),
                        showFlag: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
