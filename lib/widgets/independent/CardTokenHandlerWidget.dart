import 'package:flutter/material.dart';
import "package:stripe_sdk/stripe_sdk.dart";
import "package:stripe_sdk/stripe_sdk_ui.dart";

import "../AppWidgets.dart";

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
    CardForm form = CardForm(
      card: card,
      formKey: formKey,
      cardExpiryDecoration: App_getDefaultInputDecoration(label: "Expiry date"),
      cardCvcDecoration: App_getDefaultInputDecoration(label: "CVC"),
      cardNumberDecoration: App_getDefaultInputDecoration(label: "Card number"),
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Setup Primary Card "),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            child: Center(
              child: Icon(
                Icons.credit_card,
                color: Colors.grey,
                size: 40,
              ),
            ),
            padding: EdgeInsets.only(top: 16),
          ),
          Container(padding: EdgeInsets.symmetric(horizontal: 16), child: form),
          Center(
            child: AppPrimaryButton(
              onClick: () {},
              label: "Submit",
            ),
          )
        ],
      ),
    );
  }
}
