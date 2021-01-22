import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foodaholic_app_v/models/reservation_model.dart';
import 'package:foodaholic_app_v/providers/form_service.dart';
import 'package:foodaholic_app_v/utils/utils.dart';

class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  Reservation _reservation = new Reservation();
  String _typeValue = typesReservation.elementAt(0); //'Sugerencia';
  MenusService _service = new MenusService();

  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    _reservation.type = _typeValue;
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(14.0),
            child: Form(
                key: formKey,
                child: Column(children: [
                  _showImage(),
                  _getImageButtons(),
                  _getFieldMessage(),
                  _getTypesReport(),
                  _getSubmitButton()
                ]))));
  }

  Widget _getFieldMessage() {
    return TextFormField(
      initialValue: _reservation.message,
      decoration: InputDecoration(labelText: "Mensaje"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
        _reservation.message = value;
      },
      validator: (value) {
        if (value.length < 20) {
          return "Debe ingresar un mensaje con al menos 20 caracteres";
        } else {
          return null; //Validación se cumple al retorna null
        }
      },
    );
  }

  Widget _getTypesReport() {
    return Column(
        children: typesReservation
            .map((e) => ListTile(
                  title: Text(e),
                  leading: Radio(
                    value: e,
                    groupValue: _typeValue,
                    onChanged: (String value) {
                      setState(() {
                        _typeValue = value;
                      });
                    },
                  ),
                ))
            .toList());
  }

  Widget _getSubmitButton() {
    return Container(
        color: Theme.of(context).buttonColor,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.send), onPressed: _submitForm)
          ],
        ));
  }

  Widget _getImageButtons() {
    return Container(
      color: Theme.of(context).buttonColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(icon: Icon(Icons.image), onPressed: _pickupImage),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: _takeImage),
        ],
      ),
    );
  }

  _submitForm() async {
    if (!formKey.currentState.validate()) return;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState.save();

    if (_image != null) {
      _reservation.image = await _service.uploadImage(_image);
    }

    //Llamamos al servicio para guardar el reporte
    _service.post(_reservation).then((value) {
      if (value != null) {
        formKey.currentState.reset();
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(value.text)),
        );
      }
    });
  }

  _showImage() {
    if (_image != null) {
      return Image.file(_image);
    }
    return Image.asset('assets/images/no-image.png');
  }

  _pickupImage() {
    _selectImage(ImageSource.gallery);
  }

  _takeImage() {
    _selectImage(ImageSource.camera);
  }

  Future _selectImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}