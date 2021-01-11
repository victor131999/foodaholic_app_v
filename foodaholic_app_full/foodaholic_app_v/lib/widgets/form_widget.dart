import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/reservation_model.dart';

class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Reservation _reservation = new Reservation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(14.0),
                child: Form(
                    key: formKey,
                    child: Column(
                        children: [_getFieldMessage(), _getSubmitButton()])))));
  }

  Widget _getFieldMessage() {
    return TextFormField(
      initialValue: _reservation.message,
      decoration: InputDecoration(labelText: "Mensaje"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        _reservation.message = value;
      },
      validator: (value) {
        if (value.length < 30) {
          return "Debe ingresar un mensaje";
        } else {
          return null;
        }
      },
    );
  }

  Widget _getSubmitButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: RaisedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.send), SizedBox(width: 15.0), Text("ENVIAR")],
          ),
          onPressed: _submitForm),
    );
  }

  _submitForm() {
    if (!formKey.currentState.validate()) return;

    //Llamamos al servicio para guardar el Reservatione
  }
}