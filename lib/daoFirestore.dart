import 'package:aula/cliente.dart';
import 'package:aula/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DaoFirestore {
  static final clientes = <String, String>{"nome": "André", "idade": "20"};
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  static void inicializa() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void salvar(Cliente c, int _counter) {
    db.collection("clientes").doc("cliente$_counter").set(c.toMap).onError(
          (error, stackTrace) => print("deu ruim"),
        );
  }

  // Função para buscar clientes do Firestore
  static Stream<List<Cliente>> getClientes() {
    return FirebaseFirestore.instance.collection('clientes').snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          return Cliente(
            nome: doc['nome'],
            idade: doc['idade'],
          );
        }).toList();
      },
    );
  }
}
