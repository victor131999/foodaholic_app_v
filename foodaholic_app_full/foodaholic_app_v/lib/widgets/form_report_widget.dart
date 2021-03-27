import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/user_model.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:foodaholic_app_v/utils/preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foodaholic_app_v/models/report_model.dart';
import 'package:foodaholic_app_v/providers/form_report_service.dart';
import 'package:foodaholic_app_v/utils/utils.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class FormReportWidget extends StatefulWidget {
  FormReportWidget({Key key}) : super(key: key);

  @override
  _FormReportWidgetState createState() => _FormReportWidgetState();
}

class _FormReportWidgetState extends State<FormReportWidget> {
  CollectionReference reportsCollection =
      FirebaseFirestore.instance.collection('Reports');

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final prefs = new Preferences();

  Report _report = new Report();
  String _typeValue = typesReport.elementAt(0); //'Sugerencia';
  ReportService _service = new ReportService();
  File _image;
  final picker = ImagePicker();
  bool _onSaving = false;

  @override
  Widget build(BuildContext context) {
    _report.type = _typeValue;

    return Scaffold(
      backgroundColor: Colors.brown[100],
      key: scaffoldKey,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
         // BackgroundPage.getBackground(context),
          _getFormLogin(context)
        ],
      ),
    );
  }

  Widget _getFormLogin(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(child: Container(height: 20.0)),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: size.width * .90,
              decoration: BoxDecoration(
                  color: ThemeMain().primaryfond,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 3.0,
                        offset: Offset(0.0, 5.0),
                        spreadRadius: 3.0)
                  ]),
              child: Column(children: [
                Form(
                    key: formKey,
                    child: Column(children: [
                      _showImage(),
                      _getImageButtons(),
                      _getFieldMessage(),
                      _getTypesReport(),
                      _getSubmitButton(),
                      _getSubmitSDKButton()
                    ]))
              ])),
          SizedBox(height: 25.0)
        ],
      ),
    );
  }

  Widget _getFieldMessage() {
    return TextFormField(
      initialValue: _report.message,
      decoration: InputDecoration(labelText: "Mensaje"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
        _report.message = value;
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
        children: typesReport
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
            IconButton(
                tooltip: 'Enviar por POST',
                icon: Icon(Icons.send),
                onPressed: _onSaving ? null : _submitForm)
          ],
        ));
  }

  Widget _getSubmitSDKButton() {
    return Container(
        color: Theme.of(context).buttonColor,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                tooltip: 'Enviar por SDK',
                icon: Icon(Icons.send_and_archive),
                onPressed: _onSaving ? null : _submitSDKForm)
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

    _report.user = User.fromJsonMap(JwtDecoder.decode(prefs.token)).email;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState.save();

    setState(() {
      _onSaving = true;
    });

    if (_image != null) {
      _report.image = await _service.uploadImage(_image);
    }

    //Llamamos al servicio para guardar el reporte
    _service.post(_report).then((value) {
      if (value != null) {
        formKey.currentState.reset();
        _image = null;
        scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(value.text)),
        );
        setState(() {
          _onSaving = false;
        });
      }
    });
  }

  _submitSDKForm() async {
    if (!formKey.currentState.validate()) return;

    _report.user = User.fromJsonMap(JwtDecoder.decode(prefs.token)).email;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState.save();

    setState(() {
      _onSaving = true;
    });

    if (_image != null) {
      _report.image = await _service.uploadImage(_image);
    }

    //Llamamos al SDK para guardar el reporte
    reportsCollection.add(_report.toJson()).then((value) {
      if (value != null) {
        formKey.currentState.reset();
        _image = null;
        scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(value.id)),
        );
        setState(() {
          _onSaving = false;
        });
      }
    });
  }

  _showImage() {
    if (_image != null) {
      return Container(
          margin: EdgeInsets.all(7.0),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Image.file(_image));
    }
    return Container(
        margin: EdgeInsets.all(7.0),
        height: MediaQuery.of(context).size.height * 0.2,
        child: Image.asset('assets/images/no-image.png'));
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