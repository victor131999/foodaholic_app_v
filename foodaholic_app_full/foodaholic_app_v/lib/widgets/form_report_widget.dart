import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foodaholic_app_v/models/report_model.dart';
import 'package:foodaholic_app_v/providers/form_report_service.dart';
import 'package:foodaholic_app_v/utils/utils.dart';

class FormReportWidget extends StatefulWidget {
  FormReportWidget({Key key}) : super(key: key);

  @override
  _FormReportWidgetState createState() => _FormReportWidgetState();
}

class InputText extends StatefulWidget {
  final String label;
  final IconData icon;
  final Function(String) validator;
  const InputText({Key key, @required this.label, @required this.icon,@required this.validator})
      : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}
class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          suffixIcon: Icon(widget.icon),
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
class _FormReportWidgetState extends State<FormReportWidget> {
  final formKey = GlobalKey<FormState>();
  Report _report = new Report();
  ReportService _service = new ReportService();
  String _typeValue = typesReport.elementAt(0); //'Sugerencia';
    File _image;
  final picker = ImagePicker();


  @override
    Widget build(BuildContext context) {
    return SingleChildScrollView(
     child:  Container(
        color: Colors.white38,
        padding:
            EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
        child: Container(
          color: Colors.blue,
          child: Card(
            elevation: 20.0,
            color: Colors.lightBlue,
            child: Container(
              padding: EdgeInsets.only(
                  left: 12.0, top: 12.0, right: 12.0, bottom: 12.0),
              child:Form(
                key: formKey,
              child: Column(
                children: <Widget>[
                  _getTypesReport(),
                  _showImage(),
                  _getImageButtons(),
                  _getFieldMessage(),
                   _getSubmitButton()

                ],
              ),
              ),
            ),
          ),
        ),
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
        if (value.length ==null) {
          return "Debe ingresar un email correcto";
        } else {
          return null; //Validación se cumple al retorna null
        }
      },
    );
  }

  Widget _getTypesReport() {
    return  Column(
      
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
      _report.image = await _service.uploadImage(_image);
    }

    //Llamamos al servicio para guardar el reporte
    _service.post(_report).then((value) {
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