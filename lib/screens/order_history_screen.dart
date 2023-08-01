import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../network/api_service.dart';
import '../network/entity/transaction.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  ApiService apiService = ApiService(dio.Dio());

  List<TransactionEntity> listTransactions = [];

  Future<void> _getTransactions() async {
    try {
      final response = await apiService.getListTransaction();
      print(response);
      setState(() {
        listTransactions = response.listTransactionEntity.reversed.toList();
      });
    } catch (error) {
      showDefaultAlert(context);
      if (error is dio.DioException) {
        if (error.response?.statusCode == 400) {
          // Xử lý lỗi 400
        } else if (error.response?.statusCode == 401) {
          // Xử lý lỗi 401
        }
        // Xử lý các lỗi khác
      } else {
        // Xử lý các lỗi khác
      }
    }
  }

  @override
  void initState() {
    _getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Text(
                  'My Order History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listTransactions.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 23, 22, 22),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ID: ',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      listTransactions[index].id.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date Create: ',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      listTransactions[index]
                                          .createdAt
                                          .toString()
                                          .split('T')
                                          .first,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Price: ',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      listTransactions[index]
                                              .amount
                                              .toString() +
                                          ' dollar',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 122, 16, 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  onPressed: () {}, child: Text('See Detail'))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showDefaultAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: const Text('This is a default alert.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
