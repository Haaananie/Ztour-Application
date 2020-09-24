import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:ztour/DonationPage/payment-services.dart';
import 'donation.dart';
import 'AlertDialog2nd_widget.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flushbar/flushbar.dart';
import 'donationHistory.dart';
import 'package:intl/intl.dart';
import 'cardForm.dart';

class ExistingCardsPage extends StatefulWidget {
  String amountValueTransaction;
  static bool confirmation = false;
  String zooName;

  ExistingCardsPage(this.amountValueTransaction, this.zooName) {
    for (var i = 0; i < _ExistingCardsPageState.cards.length; i++) {
      _ExistingCardsPageState.cards[i].SelectedCard = false;
    }
    _ExistinglistState.selectedbankCard = false;
  }

  cardslist() => _ExistingCardsPageState.cards;
  payExistingCard(BuildContext context, card, amount) =>
      createState().payViaExistingCard(context, card, amount);
  // amountTransaction() => this.amountValueTransaction;
  // zooname() => this.zooName;

  @override
  _ExistingCardsPageState createState() => _ExistingCardsPageState();
}

class _ExistingCardsPageState extends State<ExistingCardsPage> {
  static final List<CardBank> cards = [];

  // List cards = [
  //   {
  //     'cardNumber': '4242424242424242',
  //     'expiryDate': '04/24',
  //     'cardHolderName': 'Muhammad Ahsan Ayaz',
  //     'cvvCode': '424',
  //     'showBackView': false,
  //     'selectedCard': false,
  //   },
  //   {
  //     'cardNumber': '5555555555554444',
  //     'expiryDate': '04/23',
  //     'cardHolderName': 'Tracer',
  //     'cvvCode': '123',
  //     'showBackView': false,
  //     'selectedCard': false,
  //   }
  // ];

  Future<void> confirmationProcess(BuildContext context) async {
    VoidCallback continueCallBack = () => {
          ExistingCardsPage.confirmation = true,
          Navigator.of(context).pop(),
        };
    BlurryDialog2nd alert = BlurryDialog2nd(
        "Confirmation", "Are you sure you want to continue?", continueCallBack);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  payViaExistingCard(BuildContext context, card, amount) async {
    ProgressDialog dialog = new ProgressDialog(context);

    var response;
    String message;

    dialog.style(
      message: 'Please wait...',
    );
    await dialog.show();

    var expiryArr = card.ExpiryDate.split('/');
    CreditCard stripeCard = CreditCard(
      number: card.CardNumber,
      expMonth: int.parse(expiryArr[0]),
      expYear: int.parse(expiryArr[1]),
    );

    if (ExistingCardsPage.confirmation == false) {
      message = 'Transaction Canceled';
    } else {
      var response = await StripeService.payViaExistingCard(
          amount: amount, currency: 'MYR', card: stripeCard);
      message = response.message;
    }

    await dialog.hide();
    var count = 0;
    Navigator.popUntil(
      context,
      (route) {
        return count++ == 1;
      },
    );

    if (message == 'Transaction successful') {
      Flushbar(
        icon: Icon(
          Icons.filter_vintage,
          color: Colors.blue,
        ),
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        title: 'Thank You!',
        message: message,
        duration: Duration(seconds: 3),
      )..show(context);
    } else if (message == 'Transaction Canceled') {
      {
        ExistingCardsPage.confirmation = false;
        Flushbar(
          icon: Icon(
            Icons.info_outline,
            color: Colors.blue,
          ),
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          title: 'Sorry',
          message: message,
          duration: Duration(seconds: 3),
        )..show(context);
      }
    } else {
      ExistingCardsPage.confirmation = false;
      Flushbar(
        icon: Icon(
          Icons.info_outline,
          color: Colors.blue,
        ),
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        title: 'Sorry',
        message: message +
            '. Possible issues: - Invalid Card Number - Poor internet connection',
        duration: Duration(seconds: 3),
      )..show(context);
    }
    // scaffoldKey.currentState
    //     .showSnackBar(
    //       SnackBar(
    //         content: Text(message),
    //         duration: new Duration(milliseconds: 3500),
    //       ),
    //     )
    // .closed;
    //     .then(
    //   (_) {
    //     Navigator.pop(context);
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child: Existinglist(_ExistingCardsPageState.cards)),
          // TextInputWidget(this.newpost)
        ],
      ),
    );
  }
}

class NewCard {
  static void newcard(
    String cardNumber,
    String expiryDate,
    String cardHolderName,
    String cvvCode,
    bool showBackView,
    bool selectedCard,
  ) {
    _ExistingCardsPageState.cards.add(
      new CardBank(cardNumber, expiryDate, cardHolderName, cvvCode,
          showBackView, selectedCard),
    );
  }
}

class Existinglist extends StatefulWidget {
  final List<CardBank> listBanks;

  Existinglist(this.listBanks);

  @override
  _ExistinglistState createState() => _ExistinglistState();
}

class _ExistinglistState extends State<Existinglist> {
  static bool selectedbankCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Existing Card'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: ListView.builder(
          itemCount: this.widget.listBanks.length,
          itemBuilder: (context, index) {
            var specificcard = this.widget.listBanks[index];
            return FlatButton(
              key: new Key(index.toString()),
              onPressed: () async {
                _ExistinglistState.selectedbankCard = true;
                setState(
                  () {
                    for (var i = 0; i < this.widget.listBanks.length; i++) {
                      this.widget.listBanks[i].SelectedCard = false;
                    }
                    this.widget.listBanks[index].SelectedCard = true;
                  },
                );
              },
              child: Card(
                shape: (this.widget.listBanks[index].SelectedCard)
                    ? new RoundedRectangleBorder(
                        side: new BorderSide(color: Colors.blue, width: 2.0),
                      )
                    : new RoundedRectangleBorder(
                        side: new BorderSide(color: Colors.white, width: 2.0),
                      ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black45,
                      width: 3,
                    ),
                  ),
                  child: CreditCardWidget(
                    cardNumber: specificcard.CardNumber,
                    expiryDate: specificcard.ExpiryDate,
                    cardHolderName: specificcard.CardHolderName,
                    cvvCode: specificcard.CvvCode,
                    showBackView: false,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(5),
          child: RaisedButton(
            color: (_ExistinglistState.selectedbankCard == true)
                ? Colors.red
                : Colors.grey,
            onPressed: () => {
              for (var i = 0; i < _ExistingCardsPageState.cards.length; i++)
                {
                  if (_ExistingCardsPageState.cards[i].SelectedCard == true)
                    {
                      Navigator.pop(
                        context,
                        _ExistingCardsPageState.cards[i].CardNumber,
                      )
                    }
                }
            },
            child: Text(
              'CONFIRM',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CardBank {
  String CardNumber;
  String ExpiryDate;
  String CardHolderName;
  String CvvCode;
  bool ShowBackView;
  bool SelectedCard;

  CardBank(this.CardNumber, this.ExpiryDate, this.CardHolderName, this.CvvCode,
      this.ShowBackView, this.SelectedCard);
}
