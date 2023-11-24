import 'package:flutter/material.dart';
import '../../../core/utils/dumy_data.dart';

class CityWithAddress extends StatefulWidget {
  const CityWithAddress({super.key});

  @override
  State<CityWithAddress> createState() => _CityWithAddressState();
}

class _CityWithAddressState extends State<CityWithAddress> {
  String yourCity = 'City';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'City ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                return showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView(
                      children: governorateEn
                          .map(
                            (city) => InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  yourCity = city;
                                });
                                print(yourCity);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5)),
                                ),
                                child: Text(
                                  city,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width * 0.135,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.7)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FittedBox(
                      child: Text(
                        yourCity,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Address',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Enter Your Address',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                  // prefixIcon: Image.asset(AssetData.phone),
                  border: outlineInputBorder(),
                  enabledBorder: outlineInputBorder(),
                  focusedBorder: outlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Future<dynamic> showBottomShet(BuildContext context) {}

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.8),
        width: 1,
      ),
    );
  }
}
