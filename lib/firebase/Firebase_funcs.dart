
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'classmodel.dart';

class FirebaseFunctions{
  static CollectionReference<UserClassmodel> getcollection(){
     return FirebaseFirestore.instance.collection('users').
       withConverter<UserClassmodel>(
        fromFirestore:(snapshot, options) => UserClassmodel.fromfirestore(snapshot.data()!) ,
        toFirestore: (user, SetOptions)=>user.toFireStore()
    );
  }

  static Future<void> addUser(UserClassmodel user){
      var collection= getcollection();
      var docref= collection.doc();
      user.id= docref.id;
      return docref.set(user);
    }

  static Future<void> deleteUser(UserClassmodel user){
    var collectioc= getcollection();
    return collectioc.doc(user.id).delete();
  }

  static Future<void> CreateUser(String email , String password,
      Function Onsuccess,Function Onerror)async{
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user?.uid!=null){Onsuccess();}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Onerror(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Onerror(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}