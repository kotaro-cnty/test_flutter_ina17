import 'package:flutter/material.dart';
import 'package:test_flutter_ina17/utils/const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test INA-17',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => MainBloc(),
          child: const MyHomePage(title: 'Test INA-17')
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> actionButtons = [
    Constant.one,
    Constant.two,
    Constant.three,
    Constant.four
  ];

  int input = 1;

  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainBloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (text){
                if (text.isNotEmpty) {
                  input = int.parse(text);
                } else {
                  input = 1;
                }
              },
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input a Number"
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 5,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                      ),
                      children: actionButtons.map((e) =>
                        OutlinedButton(onPressed: (){
                          mainBloc.add(AnswerQuestion(e, input));
                        }, child: Text(e))
                      ).toList(),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<MainBloc, MainState>(
                      builder: (context, state) {
                        return ListView(
                          children: state.result.map((e) => Text(e)).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
