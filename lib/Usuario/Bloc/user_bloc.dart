import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Usuario/Repository/firebase_auth_repository.dart';

class UserBloc implements Bloc{

  final _firebaseAuthRepository = FirebaseAuthRepository();

  //Con este metodo registro con email y contraseña
  Future<AuthResult> register(email, pass) => _firebaseAuthRepository.registerFirebase(email, pass);
  //Con este metodo logeo con email y contraseña
  Future<AuthResult> login(email, pass) => _firebaseAuthRepository.loginFirebase(email, pass);
  //Creo el observable que va a monitorear el cambio de estado
  Stream<FirebaseUser> getStatus = FirebaseAuth.instance.onAuthStateChanged;
  //Consulto el estado de ese observable
  Stream<FirebaseUser> get isLogin => getStatus;

  @override
  void dispose() {
    // TODO: implement dispose
  }
  
}