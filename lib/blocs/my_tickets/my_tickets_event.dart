part of 'my_tickets_bloc.dart';

@immutable
sealed class MyTicketsEvent {}

class FetchMyTicketEvent extends MyTicketsEvent {}

class AddTicketEvent extends MyTicketsEvent {
  AddTicketEvent({required this.ticket});

  final Ticket ticket;
}
