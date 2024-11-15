import 'empresa.dart';
import 'package:consulta_cnpj/empresa_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca CNPJ',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: EnderecoScreen(),
    );
  }
}

class EnderecoScreen extends StatefulWidget {
  @override
  _EnderecoScreenState createState() => _EnderecoScreenState();
}

class _EnderecoScreenState extends State<EnderecoScreen> {

final TextEditingController _cnpjController = TextEditingController();
  String _errorMessage = '';
  Empresa? _empresa;

  void _buscarEmpresa() async {
    final controller = EmpresaController();
    setState(() {
      _errorMessage = '';
    });
    try {
      final cnpj = _cnpjController.text;
      if(cnpj.isEmpty) {
        throw Exception('Por favor, informe um CEP valído');
      }
      Empresa empresa = await controller.buscarEmpresa(cnpj);
      setState(() {
        _empresa = empresa;
      });
    } catch (e) {
        setState(() {
          _errorMessage = e.toString();
          _empresa = null;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca CNPJ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cnpjController,
              decoration:  InputDecoration(
                labelText: "Infome CEP",
                border:  OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: _buscarEmpresa ,
              child: Text("Buscar")
            ),
            SizedBox(height: 16.0),
            if(_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              if(_empresa != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Logradouro: ${_empresa!.dataAbertura}'),
                  Text('Bairro: ${_empresa!.razaoSocial}'),
                  Text('Cidade: ${_empresa!.logradouro}'),
                  Text('Cidade: ${_empresa!.numero}'),
                  Text('Cidade: ${_empresa!.bairro}'),
                  Text('Cidade: ${_empresa!.cidade}'),
                  Text('Cidade: ${_empresa!.estado}'),
                  // Text('Cidade: ${_empresa!.pais}'),
                  Text('Cidade: ${_empresa!.cep}'),
                ],
              )
          ],
        ),
        ),
    );
  }
}
