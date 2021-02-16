import 'package:http/http.dart' as http;

import '../global/environment.dart';
import '../models/usuario.dart';
import '../models/usuarios_response.dart';
import 'auth_service.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiUrl}/usuarios', headers: {
        'Content-Type': 'applications/json',
        'x-token': await AuthService.getToken()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);
      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
