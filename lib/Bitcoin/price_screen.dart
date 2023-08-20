import 'package:flutter/material.dart';
import '../main.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'services/networking.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});
  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';
  var rate;

  DropdownButton androidDropdown() {
    setState(() {});
    List<DropdownMenuItem<String>> dropdown = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var myDropdown = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdown.add(myDropdown);
    }
    return DropdownButton(
        value: selectedCurrency,
        items: dropdown,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            print(selectedCurrency);
            updateUI();
          });
        });
  }

  CupertinoPicker iOSpicker() {
    List<Text> texts = [];
    for (String currency in currenciesList) {
      texts.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (i) {},
      children: texts,
    );
  }

  void updateUI() async {
    var data = await CoinData().getRate(selectedCurrency);
    setState(() {
      rate = data;
      print(rate[0]!.toStringAsFixed(2));
      print(rate[1]!.toStringAsFixed(2));
      print(rate[2]!.toStringAsFixed(2));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      updateUI();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            },
          )
        ],
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.grey.shade900,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 BTC = ${rate == null ? '?' : rate[0]!.toStringAsFixed(2)} $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.grey.shade800,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 ETH = ${rate == null ? '?' : rate[1]!.toStringAsFixed(2)} $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.grey.shade700,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 LTC = ${rate == null ? '?' : rate[2]!.toStringAsFixed(2)} $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey.shade600,
              height: 70,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              child: androidDropdown(),
            ),
          ],
        ),
      ),
    );
  }
}
