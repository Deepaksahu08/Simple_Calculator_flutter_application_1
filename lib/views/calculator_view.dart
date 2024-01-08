
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;
  
  final displayOneControllet = TextEditingController();
  final displayTwoControllet = TextEditingController();

  late final AppLifecycleListener _listener;
  @override
  void initState() {
    super.initState();
    displayOneControllet.text = x.toString();
    displayTwoControllet.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );

  }

  void _onShow() => print("onShow called");

  void _onHide() => print("onHide called");

  void _onResume() => print("_onResume called");

  void _onDetach() => print("_onDetach called");

  void _onInactive() => print("_onInactive called");

  void _onPause() => print("_onPause called");

  void _onRestart() => print("_onRestart called");

  void _onStateChange(AppLifecycleState state) {
    print("onStateChange called with state: $state");
  }

  @override
  void dispose(){
    displayOneControllet.dispose();
    displayTwoControllet.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //calculator DisplayOne
          CalculatoDisplay(
              hint: "Enter First Number", controller: displayOneControllet),
          const SizedBox(
            height: 30,
          ),
          CalculatoDisplay(
              hint: "Enter Second Number", controller: displayTwoControllet),
          const SizedBox(
            height: 30,
          ),
          Text(
            z.toString(),
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneControllet.text)! +
                      num.tryParse(displayTwoControllet.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneControllet.text)! -
                      num.tryParse(displayTwoControllet.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                   setState(() {
                    z = num.tryParse(displayOneControllet.text)! *
                      num.tryParse(displayTwoControllet.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () { setState(() {
                    z = num.tryParse(displayOneControllet.text)! /
                      num.tryParse(displayTwoControllet.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
            
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneControllet.clear();
                displayTwoControllet.clear();
              });
            },
            label: const Text("Clear"),
          ),
        
          //Expand

          //Calculator button
        ],
      ),
    );
  }
}

class CalculatoDisplay extends StatelessWidget {
  const CalculatoDisplay({
    super.key,
    this.hint = "Enter a Number",
    required this.controller,  
  });
  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black)),
    );
  }
}
