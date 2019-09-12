import 'package:flutter/material.dart';

class formularioCategoria extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<formularioCategoria> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
                  child:  FlutterLogo( size: 40.0,),
                ),
                Text('Join Flutter and have fun'),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "First Name",
                      labelText: "First Name"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Last Name",
                      labelText: "Last Name"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      labelText: "Phone Number"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter some text';
                    }
                    else if(!isNumeric(value))
                    {
                      return 'Please enter a valid Phone number';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Address",
                      labelText: "Address"
                  ),
                  maxLines: 4,

                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,  vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        Scaffold
                            .of(context)
                            .showSnackBar(
                            SnackBar(content: Text('Processing Data'),
                            )
                        ).closed.then((SnackBarClosedReason reason) {
                          _opennewpage();
                        });
                      }
                    },
                    child: Text('Sign up'),
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


  void _opennewpage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Success'),
            ),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
                        child:  FlutterLogo( size: 70.0,),
                      ),
                      Text('You have Successfully Signed with Flutter',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(fontWeight: FontWeight.w300),
                      ),

                    ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

bool isNumeric(String s) {
  try
  {
    return double.parse(s) != null;
  }
  catch (e)
  {
    return false;
  }
}