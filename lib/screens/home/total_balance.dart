import 'package:flutter/material.dart';

import '../../extensions/number_extension.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({
    required this.totalBalance,
    Key? key,
  }) : super(key: key);

  final int totalBalance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Suma",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 11.0,
                      ),
                ),
                Text(
                  totalBalance.toAccountBalance(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 11.0,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
