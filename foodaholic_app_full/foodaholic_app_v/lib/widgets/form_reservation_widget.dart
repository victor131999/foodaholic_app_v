import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/reservation_model.dart';
import 'package:foodaholic_app_v/providers/form_reservation_service.dart';

class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);
  

  @override
  _FormWidgetState createState() => _FormWidgetState();
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
class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  Reservation _reservation = new Reservation();
  MenusService _service = new MenusService();



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
                  _getFieldName(),
                  _getFieldIdentity(),
                  _getFieldPhone(),
                  _getFieldEmail(),
                  _getFieldTotalPerson(),
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


  Widget _getFieldName() {
    return TextFormField(
      initialValue: _reservation.name,
      decoration: InputDecoration(labelText: "Nombre completo"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
        _reservation.name = value;
      },
      validator: (value) {
        if (value.length ==null) {
          return "Debe ingresar un mensaje con al menos 20 caracteres";
        } else {
          return null; //Validación se cumple al retorna null
        }
      },
    );
  }

  Widget _getFieldIdentity() {
    return TextFormField(
      initialValue: _reservation.identity,
      decoration: InputDecoration(labelText: "Cédula"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
        _reservation.identity = value;
      },
      validator: (value) {
        if (value.length ==null) {
          return "Debe ingresar su cédula";
        } else {
          return null; //Validación se cumple al retorna null
        }

      },
    );
  }

    Widget _getFieldPhone() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: _reservation.phone,
      decoration: InputDecoration(labelText: "Numero celular"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
        _reservation.phone = value;
      },
      validator: (value) {
        if (value.length ==null) {
          return "Debe ingresar su telefono correctamente";
        } else {
          return null; //Validación se cumple al retorna null
        }
      },
    );
  }

  Widget _getFieldEmail() {
    return TextFormField(
      initialValue: _reservation.email,
      decoration: InputDecoration(labelText: "Email"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
        _reservation.email = value;
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

  Widget _getFieldTotalPerson() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: _reservation.totalperson,
      decoration: InputDecoration(labelText: "Numero de personas"),
      maxLength: 255,
      maxLines: 5,
      onSaved: (value) {
        //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
        _reservation.totalperson = value;
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

  Widget _getSubmitButton() {
    return Container(
        color: Theme.of(context).buttonColor,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.send), onPressed: _submitForm)
          ],
        ));
  }


  

  _submitForm() async {
    if (!formKey.currentState.validate()) return;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState.save();

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

}
