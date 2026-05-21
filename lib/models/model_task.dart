class ModelTask {
  final String id;
  final String title;
  final bool isComplete;
  final DateTime createdAt;

  const ModelTask({
    required this.id,
    required this.title,
    this.isComplete = false,
    required this.createdAt,
  });

  ModelTask copyWith({
    // String? id,
    String? title,
    bool? isComplete,
    // DateTime? createdAt,
  }) {
    return ModelTask(
      id: id ?? this.id,
      title: title ?? this.title,
      isComplete: isComplete ?? this.isComplete,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

enum TaskFilter { all, active, completed }
