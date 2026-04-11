import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  late BuildContext _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  void showSuccess(String message) {
    _showSnackBar(message, const Color.fromARGB(255, 1, 106, 4));
  }

  void showError(String message) {
    _showSnackBar(message, const Color.fromARGB(255, 93, 6, 0));
  }

  void showInfo(String message) {
    _showSnackBar(message, const Color.fromARGB(255, 10, 50, 82));
  }

  void showProgress(String message) {
    _showSnackBar(message, const Color.fromARGB(255, 156, 151, 0));
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}