class MapModel{
  List<List<int>>? game;
  List<int>? help;
  List<int>? prepare;

  MapModel({this.game, this.help, this.prepare});

  factory MapModel.initData(dynamic _data){
    List<List<int>> _list = List.generate(11, (dx) => List.generate(19, (dy)=>0));
    for(int i=0; i<=10; i++)
      // ignore: curly_braces_in_flow_control_structures
      for(int j=0; j<=18; j++){
        _list[i][j] = _data["game"][11*j+i];
      }
    return MapModel(
      game: _list,
      help: List<int>.from(_data['help']),
      prepare: List<int>.from(_data['prepare'])
    );
  }
}