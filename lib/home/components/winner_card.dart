import 'package:flutter/material.dart';

class WinnerCard extends StatelessWidget {
  final String name;
  final String lottery;
  final String ticket;
  final String location;
  final String date;

  const WinnerCard({
    super.key,
    required this.name,
    required this.lottery,
    required this.ticket,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357, 
      // height: 135,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: const Color(0xFF66BDFF).withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF007BFF).withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF66BDFF), Color(0xFF065087)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/1st.png',
                    height: 22,
                    width: 22,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      lottery,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // main card info
          Padding(
            padding: const EdgeInsets.only(left: 45, top: 3),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // left column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ticket
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 12,
                              decoration: BoxDecoration(
                                color: const Color(0x3319A827),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: const Icon(
                                Icons.confirmation_number_outlined,
                                size: 10,
                                color: Color(0xFF19A827),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'TICKET NUMBER',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: Text(
                            ticket,
                            style: const TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // location
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 12,
                              decoration: BoxDecoration(
                                color: const Color(0x33007BFF),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: const Icon(
                                Icons.location_on_outlined,
                                size: 10,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'LOCATION',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: Text(
                            location,
                            style: const TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // right side
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: const [
                        Text(
                          'Prediction',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                        SizedBox(width: 3),
                        Icon(Icons.verified, color: Colors.green, size: 13),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // bottom row
          Padding(
            padding: const EdgeInsets.only(left: 45, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'WON ON $date',
                  style: const TextStyle(
                    fontSize: 6,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.circle, size: 7, color: Colors.green),
                    const SizedBox(width: 3),
                    Text(
                      'VERIFIED',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 6,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
