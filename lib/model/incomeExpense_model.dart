class DBModel {
  int? id, status;
  String? title, notes, amount, category, date, time;

  DBModel({
    this.id,
    this.status,
    this.title,
    this.notes,
    this.amount,
    this.category,
    this.date,
    this.time,
  });

  factory DBModel.mapToModel(Map m1) {
    return DBModel(
      id: m1['id'],
      title: m1['title'],
      category: m1['category'],
      notes: m1['notes'],
      status: m1['status'],
      amount: m1['amount'],
      date: m1['date'],
      time: m1['time'],
    );
  }
}
