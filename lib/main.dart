import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heighttController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String info = "Informe seus dados";

  void _resetFields(){
    setState(() {
    info = "Informe seus dados!";  
    });
    weightController.text = "";
    heighttController.text = "";
    
  }

  void calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double heightt = double.parse(heighttController.text) / 100;
      double imc = weight / (heightt * heightt);
      print(imc);
      if(imc < 18.6 ){
        info = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 18.6 && imc < 24.9){
        info = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 29.9 && imc < 29.9){
        info = "Levemente pesado (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 29.9 && imc < 34.9){
        info = "Obsedidade Grau I (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 34.9 && imc < 39.9){
        info = "Obsedidade Grau II (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 40){
        info = "Obsedidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Calculadora IMC"),
            centerTitle: true,
            backgroundColor: Colors.green,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: _resetFields,
              ),
            ]),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Form(
            key:_formKey,
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 150.0, color: Colors.green),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso em KG",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 20.0),
                controller: weightController,
                validator:(value){
                  if(value.isEmpty){
                    return "Insira seu peso";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Centimetros ",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 20.0),
                controller: heighttController,
                validator:(value){
                  if(value.isEmpty){
                    return "Insira sua altura";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        calculate();
                      }
                    },
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 23.0)),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                "$info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 20.0),
              )
            ],
          ),
          
          )
        ));
  }
}