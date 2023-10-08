import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentOption = '';

  void _selectPaymentOption(String option) {
    setState(() {
      _selectedPaymentOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Select a payment option:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => _selectPaymentOption('UPI'),
                      child: Column(
                        children: const [
                          Icon(Icons.mobile_friendly),
                          SizedBox(height: 8.0),
                          Text('UPI'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => _selectPaymentOption('Credit/Debit Card'),
                      child: Column(
                        children: const [
                          Icon(Icons.credit_card),
                          SizedBox(height: 8.0),
                          Text('Credit/Debit Card'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => _selectPaymentOption('Cash On Delivery'),
                      child: Column(
                        children: const [
                          Icon(Icons.public),
                          SizedBox(height: 8.0),
                          Text('Cash On Delivery'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => _selectPaymentOption('Others'),
                      child: Column(
                        children: const [
                          Icon(Icons.more_horiz),
                          SizedBox(height: 8.0),
                          Text('Others'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                if (_selectedPaymentOption == 'UPI')
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Pay with GPay'),
                  ),
                SizedBox(height: 16.0),
                Text(
                  'Selected payment option: $_selectedPaymentOption',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
