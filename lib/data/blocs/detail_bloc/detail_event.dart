

class DetailEvent {}

class DetailLoadedEvent extends DetailEvent {
  final String xid;

  DetailLoadedEvent(this.xid);
}
