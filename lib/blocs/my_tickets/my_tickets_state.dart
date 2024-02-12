part of 'my_tickets_bloc.dart';

enum MyTicketsStatus { initial, success, failure }

class MyTicketsState extends Equatable {
  const MyTicketsState({
    this.myTickets = const <Ticket>[],
    this.myTicketsStatus = MyTicketsStatus.initial,
  });
  final List<Ticket> myTickets;
  final MyTicketsStatus myTicketsStatus;

  MyTicketsState copyWith({
    List<Ticket>? myTickets,
  }) {
    return MyTicketsState(
      myTickets: myTickets ?? this.myTickets,
    );
  }

  @override
  List<Object?> get props => [myTickets];
}
