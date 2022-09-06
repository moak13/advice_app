import 'package:flutter/material.dart';

import '../../../core/utils/size_manager.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return Container(
      height: SizeMg.height(100),
      width: SizeMg.width(450),
      margin: EdgeInsets.only(
        left: SizeMg.width(20),
        right: SizeMg.width(20),
      ),
      padding: EdgeInsets.only(
        left: SizeMg.width(20),
        right: SizeMg.width(20),
        top: SizeMg.height(10),
        bottom: SizeMg.height(10),
      ),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(SizeMg.radius(6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.info,
            color: Colors.brown,
            size: SizeMg.width(20),
          ),
          SizedBox(
            width: SizeMg.width(5),
          ),
          Expanded(
            child: Text(
              'Tired of the regulars? Us too. Let\'s help you get solid advices that count.',
              textAlign: TextAlign.justify,
              style: theme.textTheme.caption?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: SizeMg.text(16),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
