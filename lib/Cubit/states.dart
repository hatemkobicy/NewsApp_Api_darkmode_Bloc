abstract class NewsStates {}

class NewsInitialstate extends NewsStates {}

class NewsBottmnavbarstates extends NewsStates {}

class NewsGetBusinessSuccessstates extends NewsStates {}

class NewsGetBusinesserrortates extends NewsStates {
  final String error;
  NewsGetBusinesserrortates(this.error);
}

class NewsGetBusinessloadingtates extends NewsStates {}

class NewsGetSportSuccessstates extends NewsStates {}

class NewsGetSporterrortates extends NewsStates {
  final String error;
  NewsGetSporterrortates(this.error);
}

class NewsGetSportloadingtates extends NewsStates {}

class NewsGetscienceSuccessstates extends NewsStates {}

class NewsGetscienceerrortates extends NewsStates {
  final String error;
  NewsGetscienceerrortates(this.error);
}
class NewsGetsearchloadingtates extends NewsStates {}

class NewsGetsearchSuccessstates extends NewsStates {}

class NewsGetsearcherrortates extends NewsStates {
  final String error;
  NewsGetsearcherrortates(this.error);
}

class NewsGetscienceloadingtates extends NewsStates {}

class NewsGetentertainmentSuccessstates extends NewsStates {}

class NewsGetentertainmenterrortates extends NewsStates {
  final String error;
  NewsGetentertainmenterrortates(this.error);
}

class NewsGetentertainmentloadingtates extends NewsStates {}

class NewsGettechnologySuccessstates extends NewsStates {}

class NewsGettechnologyerrortates extends NewsStates {
  final String error;
  NewsGettechnologyerrortates(this.error);
}

class NewsGettechnologyloadingtates extends NewsStates {}
class Newschangetheme extends NewsStates {}


