import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Autenticacaofarebase {
  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Usuário autenticado: ${userCredential.user!.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("Usuário não encontrado");
      } else if (e.code == 'wrong-password') {
        print("Senha incorreta");
      }
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Usuário autenticado com Google");
    }
  }

  Future<void> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://sua-api.com/login'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      String token = data['token'];
      // Salve o token em um armazenamento seguro
      print("Autenticação bem-sucedida, token: $token");
    } else {
      print("Erro de autenticação");
    }
  }

  //registro
  Future<void> registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Usuário registrado com sucesso: ${userCredential.user!.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("A senha é muito fraca.");
      } else if (e.code == 'email-already-in-use') {
        print("A conta já existe para esse email.");
      }
    } catch (e) {
      print("Erro: $e");
    }
  }
}
