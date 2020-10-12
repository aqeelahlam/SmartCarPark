class Slots {
  String created_at;
  int floor;
  bool status;
  String updated_at;

  Slots({
    this.created_at,
    this.floor,
    this.status,
    this.updated_at,
  });

  @override
  String toString() {
    return 'Slots{created_at: $created_at, floor: $floor, status: $status, updated_at: $updated_at}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Slots &&
          runtimeType == other.runtimeType &&
          created_at == other.created_at &&
          floor == other.floor &&
          status == other.status &&
          updated_at == other.updated_at);

  @override
  int get hashCode =>
      created_at.hashCode ^
      floor.hashCode ^
      status.hashCode ^
      updated_at.hashCode;

  factory Slots.fromMap(Map<String, dynamic> map) {
    return new Slots(
      created_at: map['created_at'] as String,
      floor: map['floor'] as int,
      status: map['status'] as bool,
      updated_at: map['updated_at'] as String,
    );
  }

  /// This allows us to convert to a Map<String, dynamic>
  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'created_at': this.created_at,
      'floor': this.floor,
      'status': this.status,
      'updated_at': this.updated_at,
    } as Map<String, dynamic>;
  }

}