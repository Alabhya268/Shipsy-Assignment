import 'package:flutter/material.dart';
import 'package:shipsy_assignment/models/movie_tickets_model/ticket.dart';
import 'package:shipsy_assignment/screens/ticket_detail_screen/ticket_detail_screen.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';
import 'package:shipsy_assignment/utils/extensions/widget_extensions.dart';
import 'package:shipsy_assignment/widgets/kv_string_widget.dart';

class TicketTabItem extends StatelessWidget {
  const TicketTabItem({
    super.key,
    required this.curTicket,
    required this.seatString,
  });

  final Ticket curTicket;
  final String? seatString;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: context.constantUi.blackLightColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TicketDetailScreen(
              ticket: curTicket,
              fromTicketListScreen: true,
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: double.maxFinite,
                  margin: const EdgeInsets.all(5),
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(curTicket.movieImage ?? ""),
                      onError: (ob, st) {},
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      curTicket.movieName ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.constantUi.boldTextStyle1,
                    ),
                    KVStringWidget(
                      keyString: "Venue: ",
                      value: curTicket.mallName,
                    ),
                    KVStringWidget(
                        keyString: "Show time: ", value: curTicket.date),
                    KVStringWidget(
                        keyString: "Show time: ", value: curTicket.time),
                    KVStringWidget(
                      keyString: "${curTicket.seatNames?.length} seats: ",
                      value: seatString,
                    ),
                  ],
                ).paddingAll(10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
