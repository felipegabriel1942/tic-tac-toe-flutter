import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class GridService {
  final List<List<int?>> _gridContents = [];
  final int rows = 3;
  final int cols = 3;

  GridService() {
    _initGridContent();
  }

  void _initGridContent() {
    _gridContents.clear();

    for (int row = 0; row < rows; row++) {
      _gridContents.add(List.filled(cols, null));
    }
  }

  bool gridHasContent(int col, int row) {
    return _gridContents[row][col] != null;
  }

  void setGridContent(int col, int row, int? content) {
    _gridContents[row][col] = content;
  }

  int? getGridContent(int col, int row) {
    return _gridContents[row][col];
  }

  void addGridContentRow(List<int?> row) {
    _gridContents.add(row);
  }

  void resetGrid() {
    _initGridContent();
  }

  List<List<int?>> get gridContents => _gridContents;
}
