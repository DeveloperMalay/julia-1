import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:julia/data/model/product_details_model.dart';
import 'package:julia/data/repository/products_details_repo.dart';
import 'package:julia/views/chat/chatting.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productID,
  });
  final String productID;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Future<List<ProductDetails>> productDetails;

  @override
  void initState() {
    super.initState();
    setState(() {
      productDetails = getProductDetails(widget.productID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.share_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: FutureBuilder<List<ProductDetails>>(
          future: productDetails,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductDetails>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    var currentItem = data[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: currentItem.postImage.length,
                              itemBuilder: (context, index) {
                                return Image.network(
                                  "http://52.67.149.51/uploads/${currentItem.postImage[index]}",
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: SizedBox(
                            height: 68,
                            child: Text(
                              currentItem.postTitle,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10.0, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentItem.postCity,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 15),
                              ),
                              const Text(
                                '10 mins ago',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10.0, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.edit_note_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Brand',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    currentItem.postSubcategory,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10.0, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.security_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Warranty',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    '2 months warrenty',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10.0, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.help_outline),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'About the Product',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    currentItem.postDescription,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    width: 200,
                                    child: Text(
                                      'Extended warranty plans starting at ₹1699(Approx ₹566/mo.)',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 300,
                                    child: Text(
                                      'Extended protection for your device beyond the manufacturer warranty with coverage against all manufacturing defects. Know More',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${data[index].postPrice.toString()}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                              CupertinoButton(
                                color: Colors.green,
                                child: const Text(
                                  'Chat',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      // reverseTransitionDuration: const Duration(seconds: 1),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          const Chatting(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                                  begin: const Offset(1, 0),
                                                  end: Offset.zero)
                                              .animate(animation),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
