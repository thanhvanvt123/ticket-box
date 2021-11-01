import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/pages/transaction/views/transaction_list.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:ticket_box/src/widgets/custom_bottom_bar.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  SharedStates sharedStates = Get.find();
  Account? account;
  @override
  Widget build(BuildContext context) {
    account = sharedStates.account;
    return SafeArea(
        child: Scaffold(
      backgroundColor: dark_background,
      
      appBar: AppBar(
        leading: Text(''),
        backgroundColor: float_element_color,
        title: Text('Transaction'),
        foregroundColor: Colors.white,
        centerTitle: true,

      ),
      body: InkWell(
        child: TransactionList(userId: account!.userId,),
      ),
      bottomNavigationBar: CustomBottombar(),
    ));
  }
}
