part of 'my_tickets_bloc.dart';

enum MyTicketsStatus { initial, success, error, loading }

class MyTicketsState extends Equatable {
  const MyTicketsState({
    this.myTickets = const <Ticket>[],
    this.myTicketsStatus = MyTicketsStatus.initial,
  });
  final List<Ticket> myTickets;
  final MyTicketsStatus myTicketsStatus;

  MyTicketsState copyWith({
    List<Ticket>? myTickets,
    MyTicketsStatus? myTicketsStatus,
  }) {
    return MyTicketsState(
      myTickets: myTickets ?? this.myTickets,
      myTicketsStatus: myTicketsStatus ?? this.myTicketsStatus,
    );
  }

  @override
  List<Object?> get props => [myTickets, myTicketsStatus];
}
