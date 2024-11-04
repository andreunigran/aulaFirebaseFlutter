# aula

**Instalação do node
**https://firebase.google.com/docs/cli?hl=pt#install-cli-mac-linux

linux sudo apt install nodejs npm //instalação via 

**node no linux**
*windows baixar o exe
*
**instalação do firebase**
* npm install -g firebase-tools
* firebase login
**lista todos os projetos do firebase
**
* firebase projects:list


**configuração do firebase no projeto**
https://firebase.google.com/docs/flutter/setup?hl=pt&authuser=0&platform=android

* dart pub global activate flutterfire_cli
* export PATH="$PATH":"$HOME/.pub-cache/bin"
* flutterfire configure --project=testefirebase-ba6a2
**pacotes**
* flutter pub add firebase_core
* flutter pub add firebase_database
* flutter pub add cloud_firestore

* configuração adicionais dentro do android
* multiDexEnabled true

*Os aplicativos Android por padrão têm suporte a SingleDex, o que limita seu aplicativo a ter apenas 65536 métodos (referências). Então multidexEnabled = true significa simplesmente que agora você pode escrever mais de 65536 métodos (referências) em seu aplicativo.
*

**utilização**
https://developer.android.com/build/multidex?hl=pt-br
* add 
* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );