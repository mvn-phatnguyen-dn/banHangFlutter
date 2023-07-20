import 'package:final_flutter_project/components/text_field.dart';
import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../network/api_service.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final _searchplantController = TextEditingController();
  int _currentIndex = 0;
  ApiService apiService = ApiService(dio.Dio());

  List<Map<String, dynamic>> dummyData = [
    {
      "id": 52,
      "user_name": "Phatd",
      "user_phone": "0905999888",
      "address": "DN",
      "amount": 100000,
      "payment": null,
      "payment_info": null,
      "security": null,
      "status": 0,
      "created_at": "2023-06-08T06:51:15.000000Z",
      "updated_at": "2023-06-08T06:51:15.000000Z",
      "order": [
        {
          "id": 99,
          "user_id": 30,
          "product_id": 16,
          "product_name": "Alphaskin Tie Headband",
          "quantity": 10,
          "price": 8,
          "data": null,
          "status": 1,
          "transaction_id": 52,
          "created_at": "2023-06-08T04:46:35.000000Z",
          "updated_at": "2023-06-08T06:51:15.000000Z",
          "product": {
            "id": 16,
            "category_id": 12,
            "name": "Alphaskin Tie Headband",
            "image_product":
                "shop/product/1666968849_alphaskin_tie_headband_1.jpg",
            "discount": 0,
            "content":
                "When you're flying across the field or sprinting around the track, you can't afford to have hair block your view. This adidas headband comes to the rescue with breathable fabric that's stretchy and moisture-proof. Tie it at the back, and be on your way.",
            "price": 8,
            "view": 0,
            "created_at": "2022-10-28T14:54:09.000000Z",
            "updated_at": "2022-10-28T14:54:09.000000Z",
            "category": {
              "id": 12,
              "shop_id": 7,
              "name_category": "Accessories",
              "created_at": "2022-10-28T14:50:48.000000Z",
              "updated_at": "2022-10-28T14:50:48.000000Z",
              "shop": {
                "id": 7,
                "user_id": 22,
                "name_shop": "Adidas",
                "address": "5055 North Greeley Avenue Portland, OR 97217 USA",
                "phone_number": "0123456789",
                "email_shop": "adidas@gmail.com",
                "image_shop": "shop/1666968564_adidas_logo.png",
                "description": "Adidas Shop",
                "created_at": "2022-10-28T14:49:24.000000Z",
                "updated_at": "2022-10-28T14:49:24.000000Z"
              }
            }
          }
        }
      ]
    },
    {
      "id": 52,
      "user_name": "Phatd",
      "user_phone": "0905999888",
      "address": "DN",
      "amount": 100000,
      "payment": null,
      "payment_info": null,
      "security": null,
      "status": 0,
      "created_at": "2023-06-08T06:51:15.000000Z",
      "updated_at": "2023-06-08T06:51:15.000000Z",
      "order": [
        {
          "id": 99,
          "user_id": 30,
          "product_id": 16,
          "product_name": "Alphaskin Tie Headband",
          "quantity": 10,
          "price": 8,
          "data": null,
          "status": 1,
          "transaction_id": 52,
          "created_at": "2023-06-08T04:46:35.000000Z",
          "updated_at": "2023-06-08T06:51:15.000000Z",
          "product": {
            "id": 16,
            "category_id": 12,
            "name": "Alphaskin Tie Headband",
            "image_product":
                "shop/product/1666968849_alphaskin_tie_headband_1.jpg",
            "discount": 0,
            "content":
                "When you're flying across the field or sprinting around the track, you can't afford to have hair block your view. This adidas headband comes to the rescue with breathable fabric that's stretchy and moisture-proof. Tie it at the back, and be on your way.",
            "price": 8,
            "view": 0,
            "created_at": "2022-10-28T14:54:09.000000Z",
            "updated_at": "2022-10-28T14:54:09.000000Z",
            "category": {
              "id": 12,
              "shop_id": 7,
              "name_category": "Accessories",
              "created_at": "2022-10-28T14:50:48.000000Z",
              "updated_at": "2022-10-28T14:50:48.000000Z",
              "shop": {
                "id": 7,
                "user_id": 22,
                "name_shop": "Adidas",
                "address": "5055 North Greeley Avenue Portland, OR 97217 USA",
                "phone_number": "0123456789",
                "email_shop": "adidas@gmail.com",
                "image_shop": "shop/1666968564_adidas_logo.png",
                "description": "Adidas Shop",
                "created_at": "2022-10-28T14:49:24.000000Z",
                "updated_at": "2022-10-28T14:49:24.000000Z"
              }
            }
          }
        }
      ]
    },
    {
      "id": 53,
      "user_name": "Son tra Đà Nẵng",
      "user_phone": "0909878908",
      "address": "Nguyen van anh",
      "amount": 1990,
      "payment": null,
      "payment_info": null,
      "security": null,
      "status": 0,
      "created_at": "2023-06-09T01:27:26.000000Z",
      "updated_at": "2023-06-09T01:27:26.000000Z",
      "order": [
        {
          "id": 100,
          "user_id": 30,
          "product_id": 17,
          "product_name": "Big Mood Cityicon Hat",
          "quantity": 20,
          "price": 28,
          "data": null,
          "status": 1,
          "transaction_id": 53,
          "created_at": "2023-06-08T04:46:47.000000Z",
          "updated_at": "2023-06-09T01:27:26.000000Z",
          "product": {
            "id": 17,
            "category_id": 12,
            "name": "Big Mood Cityicon Hat",
            "image_product":
                "shop/product/1666969211_big_mood_cityicon_hat_1.jpg",
            "discount": 0,
            "content":
                "What's your vibe today? Whatever you're feeling, an emoji on this adidas hat probably matches it. It's made of lightweight nylon with a classic six-panel construction. A strap-back closure lets you adjust the fit.",
            "price": 28,
            "view": 0,
            "created_at": "2022-10-28T15:00:11.000000Z",
            "updated_at": "2022-10-28T15:00:11.000000Z",
            "category": {
              "id": 12,
              "shop_id": 7,
              "name_category": "Accessories",
              "created_at": "2022-10-28T14:50:48.000000Z",
              "updated_at": "2022-10-28T14:50:48.000000Z",
              "shop": {
                "id": 7,
                "user_id": 22,
                "name_shop": "Adidas",
                "address": "5055 North Greeley Avenue Portland, OR 97217 USA",
                "phone_number": "0123456789",
                "email_shop": "adidas@gmail.com",
                "image_shop": "shop/1666968564_adidas_logo.png",
                "description": "Adidas Shop",
                "created_at": "2022-10-28T14:49:24.000000Z",
                "updated_at": "2022-10-28T14:49:24.000000Z"
              }
            }
          }
        },
        {
          "id": 101,
          "user_id": 30,
          "product_id": 18,
          "product_name": "Steel Bottle 600 ML",
          "quantity": 20,
          "price": 28,
          "data": null,
          "status": 1,
          "transaction_id": 53,
          "created_at": "2023-06-08T04:47:48.000000Z",
          "updated_at": "2023-06-09T01:27:26.000000Z",
          "product": {
            "id": 18,
            "category_id": 12,
            "name": "Steel Bottle 600 ML",
            "image_product": "shop/product/1666969377_steel_bottle_1.png",
            "discount": 0,
            "content":
                "Take your hot or cold beverages to go. This bottle has a double-wall construction, so that coffee you got in the morning will still be warm after lunch. It has a hook on the top, so you can clip it to your gym bag before heading to a training session.",
            "price": 28,
            "view": 0,
            "created_at": "2022-10-28T15:02:57.000000Z",
            "updated_at": "2022-10-28T15:02:57.000000Z",
            "category": {
              "id": 12,
              "shop_id": 7,
              "name_category": "Accessories",
              "created_at": "2022-10-28T14:50:48.000000Z",
              "updated_at": "2022-10-28T14:50:48.000000Z",
              "shop": {
                "id": 7,
                "user_id": 22,
                "name_shop": "Adidas",
                "address": "5055 North Greeley Avenue Portland, OR 97217 USA",
                "phone_number": "0123456789",
                "email_shop": "adidas@gmail.com",
                "image_shop": "shop/1666968564_adidas_logo.png",
                "description": "Adidas Shop",
                "created_at": "2022-10-28T14:49:24.000000Z",
                "updated_at": "2022-10-28T14:49:24.000000Z"
              }
            }
          }
        },
        {
          "id": 102,
          "user_id": 30,
          "product_id": 37,
          "product_name": "Santal Royal",
          "quantity": 2,
          "price": 260,
          "data": null,
          "status": 1,
          "transaction_id": 53,
          "created_at": "2023-06-09T01:26:46.000000Z",
          "updated_at": "2023-06-09T01:27:26.000000Z",
          "product": {
            "id": 37,
            "category_id": 16,
            "name": "Santal Royal",
            "image_product": "shop/product/1666973112_santal_royal_1.png",
            "discount": 0,
            "content":
                "Beyond physical health, this product can help to improve your mood, enhance your appearance and boost your self-esteem. It can also help to exhibit personal style and it is an important element of social expression.",
            "price": 260,
            "view": 0,
            "created_at": "2022-10-28T16:05:12.000000Z",
            "updated_at": "2022-10-28T16:05:12.000000Z",
            "category": {
              "id": 16,
              "shop_id": 9,
              "name_category": "Perfume",
              "created_at": "2022-10-28T15:53:54.000000Z",
              "updated_at": "2022-10-28T15:53:54.000000Z",
              "shop": {
                "id": 9,
                "user_id": 24,
                "name_shop": "Guerlain",
                "address":
                    "19 East 57th Street 18th Floor New York, NY 10022 USA",
                "phone_number": "0123456789",
                "email_shop": "guerlain@gmail.com",
                "image_shop": "shop/1666972408_guerlain_logo.png",
                "description": "Guerlain Shop",
                "created_at": "2022-10-28T15:53:28.000000Z",
                "updated_at": "2022-10-28T15:53:28.000000Z"
              }
            }
          }
        },
        {
          "id": 103,
          "user_id": 30,
          "product_id": 34,
          "product_name": "Extract",
          "quantity": 1,
          "price": 350,
          "data": null,
          "status": 1,
          "transaction_id": 53,
          "created_at": "2023-06-09T01:27:04.000000Z",
          "updated_at": "2023-06-09T01:27:26.000000Z",
          "product": {
            "id": 34,
            "category_id": 16,
            "name": "Extract",
            "image_product": "shop/product/1666972892_extract_1.png",
            "discount": 0,
            "content":
                "L'Eau de Parfum Shalimar is a mythic fragrance with bergamot, iris and vanilla notes; an intense wake with a touch of impertinence, always glowing which embodies skin-caressing sensuality with a hint of the forbidden. Inspired by the passionate love story between an emperor and an Indian princess, Shalimar, which means \"temple of love\" in Sanskrit, symbolizes the promise of eternal love forevermore. It is a fragrance of desire.",
            "price": 350,
            "view": 0,
            "created_at": "2022-10-28T16:01:32.000000Z",
            "updated_at": "2022-10-28T16:01:32.000000Z",
            "category": {
              "id": 16,
              "shop_id": 9,
              "name_category": "Perfume",
              "created_at": "2022-10-28T15:53:54.000000Z",
              "updated_at": "2022-10-28T15:53:54.000000Z",
              "shop": {
                "id": 9,
                "user_id": 24,
                "name_shop": "Guerlain",
                "address":
                    "19 East 57th Street 18th Floor New York, NY 10022 USA",
                "phone_number": "0123456789",
                "email_shop": "guerlain@gmail.com",
                "image_shop": "shop/1666972408_guerlain_logo.png",
                "description": "Guerlain Shop",
                "created_at": "2022-10-28T15:53:28.000000Z",
                "updated_at": "2022-10-28T15:53:28.000000Z"
              }
            }
          }
        }
      ]
    },
    {
      "id": 54,
      "user_name": "Son tra Đà Nẵng",
      "user_phone": "0909878908",
      "address": "Nguyen van anh",
      "amount": 655,
      "payment": null,
      "payment_info": null,
      "security": null,
      "status": 0,
      "created_at": "2023-06-09T09:27:59.000000Z",
      "updated_at": "2023-06-09T09:27:59.000000Z",
      "order": [
        {
          "id": 104,
          "user_id": 30,
          "product_id": 37,
          "product_name": "Santal Royal",
          "quantity": 2,
          "price": 260,
          "data": null,
          "status": 1,
          "transaction_id": 54,
          "created_at": "2023-06-09T01:27:54.000000Z",
          "updated_at": "2023-06-09T09:27:59.000000Z",
          "product": {
            "id": 37,
            "category_id": 16,
            "name": "Santal Royal",
            "image_product": "shop/product/1666973112_santal_royal_1.png",
            "discount": 0,
            "content":
                "Beyond physical health, this product can help to improve your mood, enhance your appearance and boost your self-esteem. It can also help to exhibit personal style and it is an important element of social expression.",
            "price": 260,
            "view": 0,
            "created_at": "2022-10-28T16:05:12.000000Z",
            "updated_at": "2022-10-28T16:05:12.000000Z",
            "category": {
              "id": 16,
              "shop_id": 9,
              "name_category": "Perfume",
              "created_at": "2022-10-28T15:53:54.000000Z",
              "updated_at": "2022-10-28T15:53:54.000000Z",
              "shop": {
                "id": 9,
                "user_id": 24,
                "name_shop": "Guerlain",
                "address":
                    "19 East 57th Street 18th Floor New York, NY 10022 USA",
                "phone_number": "0123456789",
                "email_shop": "guerlain@gmail.com",
                "image_shop": "shop/1666972408_guerlain_logo.png",
                "description": "Guerlain Shop",
                "created_at": "2022-10-28T15:53:28.000000Z",
                "updated_at": "2022-10-28T15:53:28.000000Z"
              }
            }
          }
        },
        {
          "id": 105,
          "user_id": 30,
          "product_id": 36,
          "product_name": "Samsara",
          "quantity": 1,
          "price": 135,
          "data": null,
          "status": 1,
          "transaction_id": 54,
          "created_at": "2023-06-09T09:27:37.000000Z",
          "updated_at": "2023-06-09T09:27:59.000000Z",
          "product": {
            "id": 36,
            "category_id": 16,
            "name": "Samsara",
            "image_product": "shop/product/1666973055_samsara_1.png",
            "discount": 0,
            "content":
                "This fragrance was created by the house of Guerlain with perfumers Jean Paul Guerlain and Gerard Anthony. It was released in 1989. This is a very sensual warm floral perfume with a complicated personality.",
            "price": 135,
            "view": 0,
            "created_at": "2022-10-28T16:04:15.000000Z",
            "updated_at": "2022-10-28T16:04:15.000000Z",
            "category": {
              "id": 16,
              "shop_id": 9,
              "name_category": "Perfume",
              "created_at": "2022-10-28T15:53:54.000000Z",
              "updated_at": "2022-10-28T15:53:54.000000Z",
              "shop": {
                "id": 9,
                "user_id": 24,
                "name_shop": "Guerlain",
                "address":
                    "19 East 57th Street 18th Floor New York, NY 10022 USA",
                "phone_number": "0123456789",
                "email_shop": "guerlain@gmail.com",
                "image_shop": "shop/1666972408_guerlain_logo.png",
                "description": "Guerlain Shop",
                "created_at": "2022-10-28T15:53:28.000000Z",
                "updated_at": "2022-10-28T15:53:28.000000Z"
              }
            }
          }
        }
      ]
    },
    {
      "id": 55,
      "user_name": "Son tra Đà Nẵng",
      "user_phone": "0909878908",
      "address": "Nguyen van anh",
      "amount": 2765,
      "payment": null,
      "payment_info": null,
      "security": null,
      "status": 0,
      "created_at": "2023-06-12T17:59:16.000000Z",
      "updated_at": "2023-06-12T17:59:16.000000Z",
      "order": [
        {
          "id": 106,
          "user_id": 30,
          "product_id": 37,
          "product_name": "Santal Royal",
          "quantity": 10,
          "price": 260,
          "data": null,
          "status": 1,
          "transaction_id": 55,
          "created_at": "2023-06-12T14:58:44.000000Z",
          "updated_at": "2023-06-12T17:59:16.000000Z",
          "product": {
            "id": 37,
            "category_id": 16,
            "name": "Santal Royal",
            "image_product": "shop/product/1666973112_santal_royal_1.png",
            "discount": 0,
            "content":
                "Beyond physical health, this product can help to improve your mood, enhance your appearance and boost your self-esteem. It can also help to exhibit personal style and it is an important element of social expression.",
            "price": 260,
            "view": 0,
            "created_at": "2022-10-28T16:05:12.000000Z",
            "updated_at": "2022-10-28T16:05:12.000000Z",
            "category": {
              "id": 16,
              "shop_id": 9,
              "name_category": "Perfume",
              "created_at": "2022-10-28T15:53:54.000000Z",
              "updated_at": "2022-10-28T15:53:54.000000Z",
              "shop": {
                "id": 9,
                "user_id": 24,
                "name_shop": "Guerlain",
                "address":
                    "19 East 57th Street 18th Floor New York, NY 10022 USA",
                "phone_number": "0123456789",
                "email_shop": "guerlain@gmail.com",
                "image_shop": "shop/1666972408_guerlain_logo.png",
                "description": "Guerlain Shop",
                "created_at": "2022-10-28T15:53:28.000000Z",
                "updated_at": "2022-10-28T15:53:28.000000Z"
              }
            }
          }
        },
        {
          "id": 107,
          "user_id": 30,
          "product_id": 35,
          "product_name": "Mandarine Basilic Forte",
          "quantity": 1,
          "price": 165,
          "data": null,
          "status": 1,
          "transaction_id": 55,
          "created_at": "2023-06-12T15:02:30.000000Z",
          "updated_at": "2023-06-12T17:59:16.000000Z",
          "product": {
            "id": 35,
            "category_id": 16,
            "name": "Mandarine Basilic Forte",
            "image_product":
                "shop/product/1666972961_mandarine_basilic_forte_1.png",
            "discount": 0,
            "content":
                "Guerlain will launch two Eau de Parfum additions to the Aqua Allegoria line: Mandarine Basilic Forte and Rosa Rossa Forte. Both were developed by Guerlain perfumer Delphine Jelk. Mandarine Basilic Forte (above right) ~ a stronger version of 2007's Mandarine Basilic, with mandarin, blackcurrant, basil, rose, orange blossom, vanilla and sandalwood. Guerlain Mandarine Basilic Forte and Rosa Rossa Forte will be introduced in July at Sephora in the Middle East, and will go into wider distribution later in the year.",
            "price": 165,
            "view": 0,
            "created_at": "2022-10-28T16:02:41.000000Z",
            "updated_at": "2022-10-28T16:02:41.000000Z",
            "category": {
              "id": 16,
              "shop_id": 9,
              "name_category": "Perfume",
              "created_at": "2022-10-28T15:53:54.000000Z",
              "updated_at": "2022-10-28T15:53:54.000000Z",
              "shop": {
                "id": 9,
                "user_id": 24,
                "name_shop": "Guerlain",
                "address":
                    "19 East 57th Street 18th Floor New York, NY 10022 USA",
                "phone_number": "0123456789",
                "email_shop": "guerlain@gmail.com",
                "image_shop": "shop/1666972408_guerlain_logo.png",
                "description": "Guerlain Shop",
                "created_at": "2022-10-28T15:53:28.000000Z",
                "updated_at": "2022-10-28T15:53:28.000000Z"
              }
            }
          }
        }
      ]
    }
  ];

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
              itemCount: dummyData.length,
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
                                      dummyData[index]['id'].toString(),
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
                                      dummyData[index]['created_at']
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
                                      dummyData[index]['amount'].toString() +
                                          ' vnd',
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
