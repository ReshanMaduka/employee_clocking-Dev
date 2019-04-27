import 'package:flutter/material.dart';

class Schedule {
  final String shiftId;
  final String shiftDate;
  final String shiftDay;
  final String clientId;
  final String stateId;
  final String departmentId;
  final String shiftStart;
  final String shiftEnd;

  Schedule(
      {this.shiftId,
      this.shiftDate,
      this.shiftDay,
      this.clientId,
      this.stateId,
      this.departmentId,
      this.shiftStart,
      this.shiftEnd});
}
