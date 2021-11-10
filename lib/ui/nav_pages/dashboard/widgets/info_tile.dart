import 'package:flutter/material.dart';
import 'package:trove/utils/styles.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            //width: MediaQuery.of(context).size.width * .8,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Balance'),
                      Text(
                        'NGN 0.0',
                        style: AppTextStyle.blackBold24,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('Monthly Payment'),
                      Text(
                        'NGN 0.0',
                        style: AppTextStyle.blackBold24,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              const Divider(
                height: 12,
                color: Colors.amber,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  'Choose from our loan packages, start with lower loans and progressively grow')
            ]),
      ),
    );
  }
}
