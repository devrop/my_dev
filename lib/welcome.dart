
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_dev/login.dart';

class Welcome extends StatelessWidget {



  @override
  Widget build(BuildContext context){

    Color color = Theme.of(context).primaryColor;
    

    Widget buttonSection = Container(
      //width: 250.0,
      //color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
             padding: const EdgeInsets.only(top: 250.0),
             child: _buildButtonColumn(context,Colors.white, Icons.perm_identity, 'SIGN IN', 1)
           )
           //_buildButtonColumn(context,Colors.white, Icons.perm_identity, 'SIGN IN', 1),
         // _buildButtonColumn(context,color, Icons.perm_identity, 'REGISTER', 2),
        ],
      ),
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Screen'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Image.asset(
               'images/logonew2.png',
           width: 600.0,
           height: 240.0,
           fit: BoxFit.contain),
           buttonSection,
         ],
      ),

    );
  }

  Column _buildButtonColumn(BuildContext context,Color color, IconData icon, String label, int code ){
    return Column(
      //mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          //color: Colors.blue,
          margin: const EdgeInsets.only(top: 8.0),
           child: RaisedButton(
             color: Colors.blue,
           child: Text(
               label,
               style:  TextStyle(
                 fontSize: 12.0,
                 fontWeight: FontWeight.w400,
                 color: color,
               ),
               ),
               onPressed: (){
                 StatelessWidget value = null;
                 if(code == 1){
                   value = LoginApp();
                 }else if(code ==2){
                   value = LoginApp();

                 }
                   Navigator.push(context, MaterialPageRoute(builder: (context) => value),);
    }
           ),

        )
      ],


    );

  }
}

