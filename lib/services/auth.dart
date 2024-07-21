import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  Future<String> signup(String email,String password)async{
    String res ='Some error occured';
    try{
     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
     res='success';
     
    } catch(err){
     res=err.toString();
    }
    return res;
  }

    Future<String> signin(String email,String password)async{
    String res ='Some error occured';
    try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     res='success';
    } catch(err){
     res=err.toString();
    }
    return res;
  }
}