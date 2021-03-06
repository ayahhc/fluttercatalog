import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child:Column(
        children: [
          Image.asset("assest/images/bird.png",alignment: Alignment.center,fit: BoxFit.cover
          ,),
          SizedBox(height: 30.0),
          Text("Welcome to Catalog App!!!",
          style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.blue
          ),
          ),
          SizedBox(height: 30.0,),
       Padding(
         padding: const EdgeInsets.all(30.0),
         child: Column(children: [
              TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your name",
                labelText:"Username"
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                labelText: "Password"
                ),
            ),
            SizedBox(height: 20.0,),
           ElevatedButton(onPressed: (){
             print("hey chhaya your login page");
           },
            child: Text("Login"),
            )
         ],
         ),
       )
        ],
      )
    );
  }
}