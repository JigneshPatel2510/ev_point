import 'package:ev_point/select_model.dart';
import 'package:flutter/material.dart';

class SelectBrand extends StatefulWidget {
  final bool? isFromMyVehicle;

  const SelectBrand({super.key, this.isFromMyVehicle});

  @override
  State<SelectBrand> createState() => _SelectBrandState();
}

class _SelectBrandState extends State<SelectBrand> {
  List<String> brandList = [
    'Audi',
    'BMW',
    'Ampere',
    'AshokLeland',
    'Ather Energy',
    'Hero Electric',
    'Hero MotoCorp',
    'Hyundai',
    'Mahindra Electric',
    ' MG Motor India',
    'Okinawa Autotech',
    'Ola Electric',
    'Tata Motors',
    'Tesla',
    'TVS Motor Company'
  ];

  List<String> filterBrandList = [];
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        leadingWidth: 30,
        title: const Text("Select Brand",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: searchText.text.isEmpty
                    ? const Color(0xffF5F5F5)
                    : const Color(0xffECFCF6),
                border: Border.all(
                    color: searchText.text.isEmpty
                        ? Colors.transparent
                        : const Color(0xff02B864)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Image.asset(
                      "assets/icons/ic_search.png",
                      color: Colors.grey.shade400,
                      width: 27,
                      height: 27,
                    ),
                  ),
                  Expanded(
                      child: TextField(
                    controller: searchText,
                    onChanged: (value) {
                      filterBrandList.clear();
                      for (int i = 0; i < brandList.length; i++) {
                        if (brandList[i]
                            .toLowerCase()
                            .contains(value.toLowerCase())) {
                          filterBrandList.add(brandList[i]);
                        }
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchText.text.isEmpty
                    ? brandList.length
                    : filterBrandList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 36, right: 16),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectModel(
                                vehicle: searchText.text.isEmpty
                                    ? brandList[index]
                                    : filterBrandList[index],
                                isFromMyVehicle: widget.isFromMyVehicle),
                          ));
                    },
                    title: Text(searchText.text.isEmpty
                        ? brandList[index]
                        : filterBrandList[index]),
                    trailing: const Icon(Icons.navigate_next),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
