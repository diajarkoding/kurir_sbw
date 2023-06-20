import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kurir_sbw/common/assets.dart';
import 'package:kurir_sbw/common/constant.dart';
import 'package:kurir_sbw/pages/chat_page.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  bool isActive = true;

  GoogleMapController? mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng center = const LatLng(-7.2580729, 112.7442639);

  void toggleStatus() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isActive ? kGreen : Colors.red;

    void openBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.70,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 1.5,
                            width: 100,
                            color: kLightGrey,
                            margin: const EdgeInsets.only(bottom: 4),
                          ),
                          Container(
                            height: 1.5,
                            width: 100,
                            color: kLightGrey,
                            margin: const EdgeInsets.only(bottom: 16),
                          ),
                          Text(
                            'Konsumen',
                            style: blackTextStyle.copyWith(
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TitleRow(
                      title: 'ID Konsumen',
                      subtitle: '999.123456',
                    ),
                    const TitleRow(
                      title: 'Nama Lengkap',
                      subtitle: 'Riswanto',
                    ),
                    const TitleRow(
                      title: 'No Whatsapp',
                      subtitle: '0821-2345-6789',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Foto',
                          style: blackTextStyle.copyWith(fontWeight: bold),
                        ),
                        Image.asset(
                          image,
                          width: 60,
                          height: 60,
                        )
                      ],
                    ),
                    const Divider(
                      color: kLightGrey,
                      thickness: 1,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Divider(
                        color: kLightGrey,
                        thickness: 1,
                      ),
                    ),
                    const TitleRow(
                      title: 'Jumlah Dus ',
                      subtitle: '2 Dus',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Alamat Kunsumen',
                      style: blackTextStyle.copyWith(fontWeight: bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                        'Jl. Taman Kutisari No.4, Kutisari, Kec. Tenggilis Mejoyo, Kota SBY, Jawa Timur 60291 '),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            backgroundColor: const Color(0XFFFDCE22),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Kembali',
                            style: blackTextStyle.copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    Widget panel() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0XFFD0D0D0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order',
                    style: blackTextStyle.copyWith(fontWeight: bold),
                  ),
                  Text(
                    'Antar Barang',
                    style: blackTextStyle.copyWith(fontWeight: bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => openBottomSheet(context),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kLightBlue,
                ),
                child: Center(
                  child: Text(
                    'Lihat Data Orderan',
                    style: blackTextStyle.copyWith(fontWeight: bold),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kLightGrey),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        profileIcon,
                        width: 27,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Riswanto',
                        style: blackTextStyle.copyWith(
                            fontWeight: bold, fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatPage(),
                              )),
                          child: SvgPicture.asset(chatIcon)),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(callIcon),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kGreen,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kLightGrey,
                        width: 1.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    'Sudah Mengirim Barang',
                    style: whiteTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        title: Text(
          'Kurir',
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ElevatedButton(
              onPressed: toggleStatus,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                isActive ? 'AKTIF' : 'NON-AKTIF',
                style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SlidingUpPanel(
        minHeight: 290,
        maxHeight: 290,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        parallaxEnabled: true,
        panelBuilder: panel,
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(
                target: center,
                zoom: 11.5,
              ),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  lightPanic,
                  width: 49,
                  height: 45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleRow({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: blackTextStyle,
              ),
              Text(
                subtitle,
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
            ],
          ),
          const Divider(
            color: kLightGrey,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
