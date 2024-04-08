import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

class StationItem extends StatefulWidget {
  final int index;
  const StationItem({super.key,required this.index});

  @override
  State<StationItem> createState() => _StationItemState();
}

class _StationItemState extends State<StationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(width: 1, color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "99 Prospect Park W",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("brooklyn 99 Prospect Park W",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xff0DC26F),
                      borderRadius: BorderRadius.circular(30)),
                  child: Transform.rotate(
                      angle: 45 * math.pi / 180,
                      child: const Center(
                          child: Icon(
                            Icons.navigation,
                            color: Colors.white,
                            size: 30,
                            weight: 40,
                          ))),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text('4.3'),
                const SizedBox(
                  width: 10,
                ),
                RatingBar.builder(
                  itemSize: 15,
                  initialRating: 4.3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(
                  width: 7,
                ),
                const Text("(107 reviews)",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                    height: 25,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: widget.index%2==0?Colors.red:Colors.green,
                        borderRadius: BorderRadius.circular(6)),
                    child:  Center(
                        child: Text(widget.index%2==0?"In Use":"Available",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)))),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.location_pin,
                    color: Colors.black54, size: 18),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "1.9 km",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.car_repair, color: Colors.black54),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "7 mins",
                  style: TextStyle(color: Colors.grey.shade500),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset("assets/icons/ic_plug1.png",
                          height: 20, width: 30),
                      // const SizedBox(width: 10,),
                      Image.asset("assets/icons/ic_plug2.png",
                          height: 20, width: 30),
                      // const SizedBox(width: 10,),
                      Image.asset("assets/icons/ic_plug3.png",
                          height: 20, width: 30),
                      // const SizedBox(width: 10,),
                    ],
                  ),
                ),
                const Text(
                  "3 Chargers",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.green,
                  size: 15,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    child: InkWell(
                      onTap: (){},
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1.5, color: Colors.green)),
                        child:  const Center(
                          child: Text("View",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    child: InkWell(
                      onTap: () {
                        
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff01B763)),
                        child: const Center(
                          child: Text(
                            "Book",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
