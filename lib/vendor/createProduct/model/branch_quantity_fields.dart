import 'package:flutter/material.dart';

class BranchQuantityFields {
  final TextEditingController quantityController;
  final TextEditingController quantityReminderController;
  int? branchId;
  final int? quantityId;

  BranchQuantityFields({
    required this.quantityController,
    required this.quantityReminderController,
    this.branchId,
    this.quantityId,
  });
}
