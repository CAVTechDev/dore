import 'package:firebase_auth/firebase_auth.dart';

import '../models/usermodels.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

User? currentUser;


UserModel? userModelCurrentInfo;