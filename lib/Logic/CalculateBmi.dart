class CalculateBmi{
  CalculateBmi({this.height,this.weight});
  final int height;
  final int weight;

  double _bmi;


  String calculate(){
    _bmi=weight/(height*height*0.0001);
    print(_bmi);
  return _bmi.toStringAsFixed(1);
}

String getResult(){
    if (_bmi<18.5) {
      return 'UNDERWEIGHT';
    } else if(_bmi>=18.5 &&_bmi<25) {
      return 'NORMAL';
    }else{
      return 'OVERWEIGHT';
    }
}

  String getMessage(){
    if (_bmi<18.5) {
      return 'Please Eat more..Cover your bones with something more than just skin';
    } else if(_bmi>=18.5 &&_bmi<25) {
      return 'Awesome you are Fit..try to be that way';
    }else{
      return 'I am sorry..but you are fat, do something about it';
    }
  }
}