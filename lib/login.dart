import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:my_dev/dashboard.dart';
import 'package:my_dev/loginservice.dart';

class LoginApp extends StatelessWidget{

@override
  Widget build(BuildContext context){
   return new MaterialApp(
     title: 'Login Form',
     color: Colors.purple,
     theme: new ThemeData(primaryColor: Colors.blue),
     home: new MyHomePage(title: 'Login Form'),
   );
  }


}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

final GlobalKey<ScaffoldState> _scaffoldKeyLogin = new GlobalKey<ScaffoldState>();
final GlobalKey<FormState> _formKeyLogin = new GlobalKey<FormState>();
 UserLogin _newUserLogin = new UserLogin();
  
  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKeyLogin.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }
void _submitLogin() {
    final FormState form = _formKeyLogin.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event
      var loginService = new LoginService();
      loginService.login(_newUserLogin);
    }
  }



 String _validatePassword(String value) {
    if (value.length < 1) {
      return 'The Password must be at least 1 characters.';
    }

    return null;
  }
 
 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKeyLogin,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKeyLogin,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your username',
                      labelText: 'Username',
                    ),
                    inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                    onSaved:(val) => _newUserLogin.username = val,

                  ),
                  new TextFormField(
                     obscureText: true, 
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your  password',
                      labelText: 'Password',
                    ),
                    inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) => _validatePassword(val) ,
                    onSaved:(val) => _newUserLogin.password = val,

                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child:
                       new Row (
                         children :<Widget>[
                           Expanded(
                           child : new RaisedButton(
                            child : const Text('Login'),
                            onPressed: _submitLogin,
                       )),
                           Expanded(
                             child: new RaisedButton(
                               child : const Text('Batal'),
                               onPressed: () {
                                 //Navigator.pop(context);
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => DashboarPage()),);
                               },
                             )
                           )
                         ],
                       )
                  ),
                ],
              ))),
    );
  }

}

//@JsonSerializable()
class UserLogin{

    //@JsonKey(name: 'username')
    String username;
    //@JsonKey(name: 'password')
    String password;
    //@JsonKey(name: 'token')
    String token;
    
}