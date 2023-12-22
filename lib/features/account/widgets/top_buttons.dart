import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';
class TonButttons extends StatefulWidget {
  const TonButttons({Key? key}) : super(key: key);

  @override
  State<TonButttons> createState() => _TonButttonsState();
}

class _TonButttonsState extends State<TonButttons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Order', onTap: (){}),
            AccountButton(text: 'Turn Seller', onTap: (){}),

          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(text: 'Log Out', onTap: (){}),
            AccountButton(text: 'Wish List', onTap: (){}),

          ],
        )
      ],
    );
  }
}
