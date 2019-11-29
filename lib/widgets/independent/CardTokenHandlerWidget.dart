import 'package:flutter/material.dart';
import "package:stripe_sdk/stripe_sdk.dart";
import "package:stripe_sdk/stripe_sdk_ui.dart";

const publishableKey = "pk_test_JPJ4BllTNIq658zwRmfpnLB9";

exampleStripeSetup() async {}

class CardTokenHandlerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardTokenHandlerState();
  }
}

class _CardTokenHandlerState extends State<CardTokenHandlerWidget> {
  final formKey = GlobalKey<FormState>();
  final card = StripeCard();

  bool showMessage = false;

  String responseA = "ini";

  void pay() async {
    StripeApi.init(publishableKey);

    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      setState(() async {
        responseA = card.validateCard().toString();

        StripeApi.init(publishableKey);

        Map d = await StripeApi.instance.createPaymentMethodFromCard(card);

        Stripe.init(publishableKey);

        Stripe.instance
            .confirmPayment("", "")
            .then((dynamic d) {})
            .catchError(() {
          setState(() {
            responseA = "error occ";
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CardForm form = CardForm(card: card, formKey: formKey);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Card "),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            child: Center(
              child: Icon(
                Icons.credit_card,
                size: 40,
              ),
            ),
            padding: EdgeInsets.only(top: 16),
          ),
          Container(padding: EdgeInsets.symmetric(horizontal: 16), child: form),
          Center(child: Text(responseA)),
          Center(
            child: RaisedButton(
              onPressed: () {
                pay();
                setState(() {
                  showMessage = true;
                });
              },
              child: Text("submit"),
            ),
          )
        ],
      ),
    );
  }
}
