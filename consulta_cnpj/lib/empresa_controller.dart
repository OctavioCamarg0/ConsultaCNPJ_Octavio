import 'dart:convert';
import 'empresa.dart';
import 'package:http/http.dart' as http;

class EmpresaController {
  Future<Empresa> buscarEmpresa(String cnpj) async {
    final url = Uri.parse('https://open.cnpja.com/office/$cnpj');
    final resposta = await http.get(url);
    if (resposta.statusCode == 200) {
      Map<String, dynamic> cnpj = jsonDecode(resposta.body);
      if(cnpj.containsKey('erro')){
        throw Exception("Erro na busca do endereço: ${resposta.statusCode}");
      }
      return Empresa.deJson(cnpj);      
    }else{
      throw Exception("Erro na busca do endereço: ${resposta.statusCode}");
      //return null;
    }
  }
}