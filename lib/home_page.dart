import 'package:flutter/material.dart';
import 'receita.dart';
import 'detalhes_page.dart';
import 'configuracoes_page.dart';
import 'sobre_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceSelecionado = 0;

  final List<Receita> doces = const [
    Receita(
      'Bolo de Chocolate',
      'Um bolo simples e fofinho de chocolate.',
      [
        '2 xícaras de farinha de trigo',
        '1 xícara de açúcar',
        '1 xícara de chocolate em pó',
        '3 ovos',
        '1 xícara de leite',
      ],
      'Misture os ingredientes secos. Acrescente os ovos e o leite. '
          'Misture bem e coloque em uma forma untada. '
          'Asse até o bolo ficar pronto.',
    ),
    Receita(
      'Brigadeiro',
      'Doce tradicional brasileiro feito com chocolate.',
      [
        '1 lata de leite condensado',
        '1 colher de manteiga',
        '4 colheres de chocolate em pó',
      ],
      'Coloque todos os ingredientes em uma panela. '
          'Mexa em fogo baixo até desgrudar do fundo. '
          'Depois deixe esfriar e faça as bolinhas.',
    ),
    Receita(
      'Pudim',
      'Uma sobremesa cremosa e fácil de preparar.',
      [
        '1 lata de leite condensado',
        '2 medidas de leite',
        '3 ovos',
        '1 xícara de açúcar',
      ],
      'Faça a calda com o açúcar. Bata os demais ingredientes '
          'e coloque na forma. Asse em banho-maria até firmar.',
    ),
  ];

  final List<Receita> salgadas = const [
    Receita(
      'Lasanha',
      'Lasanha tradicional com molho e queijo.',
      [
        'Massa de lasanha',
        'Molho de tomate',
        'Carne moída',
        'Queijo',
        'Presunto',
      ],
      'Prepare o molho com a carne. Monte camadas de massa, '
          'molho, presunto e queijo. Leve ao forno até gratinar.',
    ),
    Receita(
      'Coxinha',
      'Salgado brasileiro recheado com frango.',
      [
        'Massa para coxinha',
        'Frango desfiado',
        'Cebola',
        'Farinha de rosca',
        'Óleo',
      ],
      'Prepare o recheio com o frango. Faça a massa e modele '
          'as coxinhas. Passe na farinha de rosca e frite.',
    ),
    Receita(
      'Misto',
      'Misto quente simples e saboroso.',
      [
        '2 fatias de pão',
        'Presunto',
        'Queijo',
      ],
      'Coloque o presunto e o queijo entre as fatias de pão'
          ' e leve à frigideira até dourar.',
    ),
  ];

  final List<Receita> bebidas = const [
    Receita(
      'Suco de Laranja',
      'Bebida natural e refrescante.',
      [
        '4 laranjas',
        'Água',
        'Açúcar a gosto',
        'Gelo',
      ],
      'Esprema as laranjas. Misture com água e açúcar. '
          'Acrescente gelo e sirva.',
    ),
    Receita(
      'Vitamina de Morango',
      'Vitamina cremosa e refrescante de morango.',
      [
        '1 xícara de morangos',
        '1 copo de leite',
        'Açúcar a gosto',
      ],
      'Bata os morangos, o leite e o açúcar no liquidificador até ficar cremoso.',
    ),
    Receita(
      'Suco de Uva',
      'Suco de uva refrescante e fácil de preparar.',
      [
        '1 xícara de uvas',
        '1 copo de água',
        'Açúcar a gosto',
      ],
      'Bata as uvas com a água no liquidificador e adoce a gosto.',
    ),
  ];

  List<Receita> _receitasDaAba() {
    if (_indiceSelecionado == 0) {
      return doces;
    } else if (_indiceSelecionado == 1) {
      return salgadas;
    } else {
      return bebidas;
    }
  }

  String _tituloDaAba() {
    if (_indiceSelecionado == 0) {
      return 'Doces';
    } else if (_indiceSelecionado == 1) {
      return 'Salgadas';
    } else {
      return 'Bebidas';
    }
  }

  void _abrirReceita(Receita receita) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => DetalhesPage(receita: receita),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final receitas = _receitasDaAba();

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloDaAba()),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                'Minhas Receitas',
                style: TextStyle(fontSize: 24),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ConfiguracoesPage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const SobrePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Receitas ${_tituloDaAba().toLowerCase()}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Escolha uma receita para ver os detalhes.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: receitas.length,
                itemBuilder: (context, index) {
                  final receita = receitas[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const Icon(
                        Icons.restaurant_menu,
                        size: 36,
                      ),
                      title: Text(
                        receita.titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(receita.descricao),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        _abrirReceita(receita);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSelecionado,
        onTap: (indice) {
          setState(() {
            _indiceSelecionado = indice;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Doces',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Salgadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Bebidas',
          ),
        ],
      ),
    );
  }
}