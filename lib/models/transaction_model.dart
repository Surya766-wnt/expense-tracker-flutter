class TransactionModel {

  final String title;
  final double amount;
  final String type;
  final String category;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.type,
    final String category;
  });

}