import 'package:flutter/material.dart';


class RegisterAlternateAddress extends StatefulWidget {
  @override
  _RegisterAlternateAddressState createState() => _RegisterAlternateAddressState();
}

class _RegisterAlternateAddressState extends State<RegisterAlternateAddress> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            tooltip: "Previous Screen",
            icon: new Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: null,
          ),
          title: new Text("Enter New Address",
            style: new TextStyle(
              color: Colors.white,
            ),),
          backgroundColor: Colors.black,



        ),
        body: new Container(
            child: new Column(
                children: <Widget>[
                  new Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        // key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            createFormField ("Address Line 1",(value){

                            },
                            ),

                            createFormField("Address Line 2", (value){

                            }
                            ),

                            createFormField("City", (value){

                            }
                            ),

                            createFormField("Postcode", (value){

                            }
                            ),

                            createFormField("State", (value){

                            }
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  new Center(
                    child: new Container(
                      child: new Center(child: FlatButton(
                        color: Colors.grey,
                        textColor: Colors.white,
                        onPressed: ()=>debugPrint("add new"),
                        child: new Text ("Add new address",
                          style: new TextStyle(
                              fontSize: 12.3
                          ),),
                      ),),
                    ),
                  )
                ]
            )
        )

    );








  }
}

Widget createFormField(String placeholder, Function validation) {
  return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: validation,
        decoration: InputDecoration(
            labelText: placeholder
        ),
        maxLines: null,
        autovalidate: true,
      )
  );


}