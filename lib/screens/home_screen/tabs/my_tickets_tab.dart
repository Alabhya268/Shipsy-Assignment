import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/my_tickets/my_tickets_bloc.dart';
import 'package:shipsy_assignment/screens/home_screen/components/ticket_tab_item.dart';
import 'package:shipsy_assignment/utils/app_error.dart';

class MyTicketsTab extends StatefulWidget {
  const MyTicketsTab({super.key});

  @override
  State<MyTicketsTab> createState() => _MyTicketsTabState();
}

class _MyTicketsTabState extends State<MyTicketsTab> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await fetchTickets();
    });
  }

  Future<void> fetchTickets() async {
    try {
      final myTicketBloc = context.read<MyTicketsBloc>();
      myTicketBloc.add(FetchMyTicketEvent());
    } catch (e, s) {
      reportError.handleAppError(e, s);
    }
  }

  @override
  Widget build(BuildContext context) {
    final myTicketBloc = context.watch<MyTicketsBloc>();
    final ticketData = myTicketBloc.state.myTickets.reversed.toList();

    return ticketData.isNotEmpty
        ? ListView.builder(
            itemCount: ticketData.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final curTicket = ticketData[index];
              final seatString = ticketData[index].seatNames?.join(", ");
              return TicketTabItem(
                  curTicket: curTicket, seatString: seatString);
            },
          )
        : const Center(
            child: Text("No ticket purchased yet"),
          );
  }
}
