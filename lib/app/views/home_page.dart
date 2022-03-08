import 'package:flutter/material.dart';
import 'package:money_conversion/app/components/currency_box.dart';
import 'package:money_conversion/app/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Conversor"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ListView(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  "assets/images/logo.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 50),
                CurrencyBox(
                  controller: _homeController.toText,
                  items: _homeController.currencies,
                  selectedItem: _homeController.toCurrency,
                  onChanged: (model) {
                    setState(() {
                      _homeController.toCurrency = model!;
                    });
                  },
                ),
                const SizedBox(height: 10),
                CurrencyBox(
                  controller: _homeController.fromText,
                  items: _homeController.currencies,
                  selectedItem: _homeController.fromCurrency,
                  onChanged: (model) {
                    setState(() {
                      _homeController.fromCurrency = model!;
                    });
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  onPressed: () => _homeController.convert(),
                  child: const Text("Converter"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
