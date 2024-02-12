import 'package:flutter/material.dart';
import 'package:shipsy_assignment/models/movie_tickets_model/ticket.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';
import 'package:shipsy_assignment/utils/extensions/widget_extensions.dart';
import 'package:shipsy_assignment/widgets/kv_string_widget.dart';

class TicketDetailScreen extends StatelessWidget {
  const TicketDetailScreen({
    super.key,
    required this.ticket,
    this.fromTicketListScreen = false,
  });

  final Ticket ticket;
  final bool fromTicketListScreen;

  @override
  Widget build(BuildContext context) {
    String seats = ticket.seatNames?.join(", ") ?? "";

    void bottomNavOnTap() {
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Details"),
      ),
      bottomNavigationBar: !fromTicketListScreen
          ? InkWell(
              onTap: bottomNavOnTap,
              child: Container(
                height: 65,
                color: context.constantUi.primaryColor,
                child: Center(
                  child: Text(
                    "Go Back",
                    style: context.constantUi.headingTextStyle1Fun(
                      context.constantUi.whiteColor,
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: Column(
        children: [
          ticketDetailCard(context, seats),
          if (!fromTicketListScreen)
            Center(
              child: Text(
                "Ticket booked sucessfully!",
                style: context.constantUi.headingTextStyle1,
              ),
            ),
        ],
      ),
    );
  }

  Widget ticketDetailCard(BuildContext context, String seats) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.constantUi.blackLightColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.maxFinite,
              child: Image.network(
                ticket.movieImage ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, ob, st) => Container(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KVStringWidget(
                    keyString: "Movie name: ", value: ticket.movieName ?? ""),
                KVStringWidget(
                    keyString: "Mall name: ", value: ticket.mallName ?? ""),
                KVStringWidget(
                    keyString: "Show date: ", value: ticket.date ?? ""),
                KVStringWidget(
                    keyString: "Show time: ", value: ticket.time ?? ""),
                KVStringWidget(keyString: "Seats: ", value: seats),
                KVStringWidget(
                  keyString: "Total price: ",
                  value: ticket.totalPrice.toString(),
                ),
              ],
            ).paddingAll(10)
          ],
        ),
      ),
    );
  }
}
