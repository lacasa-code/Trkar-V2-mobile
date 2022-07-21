import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/router/router.gr.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListTile(
        leading: Transform.scale(
          scale: 0.55,
          child: Image.asset(
            'assets/icons/master-card.png',
          ),
        ),
        title: Text(
          '544660707'.replaceRange(0, 5, '*****'),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          'MasterCard',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.more_horiz,
          ),
          color: Colors.black,
          onPressed: () {
            log('message');
            context.router.push(
              CreateNewPaymentMethodRouter(isEdit: true),
            );
          },
        ),
      ),
    );
  }
}
