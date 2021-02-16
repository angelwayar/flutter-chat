import 'package:casa_club/models/mensaje_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'auth_service.dart';
import '../models/usuario.dart';
import '../global/environment.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final resp = await http.get(
      '${Environment.apiUrl}/mensajes/$usuarioID',
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      }
    );

    final mensajeResp = mensajesResponseFromJson(resp.body);

    return mensajeResp.mensajes;
  }
}
