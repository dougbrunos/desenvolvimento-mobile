import 'package:flutter/material.dart';
import 'confirmacao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Usuário',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _emailController = TextEditingController();
  final _idadeNode = FocusNode();
  final _emailNode = FocusNode();

  String? _sexoSelecionado;
  bool _aceitoTermos = false;

  final List<String> _sexoOptions = ['Masculino', 'Feminino', 'Outro'];

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    _emailController.dispose();
    _idadeNode.dispose();
    _emailNode.dispose();
    super.dispose();
  }

  bool _validarCampos() {
    if (_nomeController.text.isEmpty) {
      _mostrarErro('Nome não pode ser vazio');
      return false;
    }

    if (_idadeController.text.isEmpty) {
      _mostrarErro('Idade não pode ser vazia');
      return false;
    }

    int? idade;
    try {
      idade = int.parse(_idadeController.text);
    } catch (e) {
      _mostrarErro('Idade deve ser um número válido');
      return false;
    }

    if (idade < 18) {
      _mostrarErro('Idade deve ser maior ou igual a 18');
      return false;
    }

    if (_emailController.text.isEmpty) {
      _mostrarErro('Email não pode ser vazio');
      return false;
    }

    if (!_emailController.text.contains('@') || !_emailController.text.contains('.')) {
      _mostrarErro('Email inválido');
      return false;
    }

    if (_sexoSelecionado == null) {
      _mostrarErro('Selecione o sexo');
      return false;
    }

    if (!_aceitoTermos) {
      _mostrarErro('Aceite os termos de uso');
      return false;
    }

    return true;
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _cadastrar() {
    if (_validarCampos()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Confirmacao(
            nome: _nomeController.text,
            idade: _idadeController.text,
            email: _emailController.text,
            sexo: _sexoSelecionado!,
            aceitoTermos: _aceitoTermos,
            nomeController: _nomeController,
            idadeController: _idadeController,
            emailController: _emailController,
            sexoSelecionado: _sexoSelecionado,
            aceitoTermosState: _aceitoTermos,
            onEditar: (nome, idade, email, sexo, aceito) {
              setState(() {
                _nomeController.text = nome;
                _idadeController.text = idade;
                _emailController.text = email;
                _sexoSelecionado = sexo;
                _aceitoTermos = aceito;
              });
            },
          ),
        ),
      );
    }
  }

  void _proximoCampo(FocusNode proximoNode) {
    FocusScope.of(context).requestFocus(proximoNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Preencha os campos abaixo',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: _nomeController,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => _proximoCampo(_idadeNode),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite seu nome',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: _idadeController,
                    focusNode: _idadeNode,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => _proximoCampo(_emailNode),
                    decoration: InputDecoration(
                      labelText: 'Idade',
                      hintText: 'Digite sua idade',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: _emailController,
                    focusNode: _emailNode,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Digite seu email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: const Text('Selecione o sexo'),
                    value: _sexoSelecionado,
                    onChanged: (String? novoValor) {
                      setState(() {
                        _sexoSelecionado = novoValor;
                      });
                    },
                    items: _sexoOptions.map((String opcao) {
                      return DropdownMenuItem<String>(
                        value: opcao,
                        child: Text(opcao),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _aceitoTermos,
                      onChanged: (bool? novoValor) {
                        setState(() {
                          _aceitoTermos = novoValor ?? false;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    const Expanded(
                      child: Text(
                        'Aceito os termos de uso',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _cadastrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
