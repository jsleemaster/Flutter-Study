import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
  /**
   * _buildSuggestions() 함수는 단어 쌍 마다 한 번 씩 _buildRow()를 호출
   */
  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      /* 1.
      itemBuilder 콜백은 단어 쌍이 제안될 때마다 호출되고 각각을 ListTile 행에 배치합니다. 
      짝수 행인 경우 ListTile 행에 단어 쌍을 추가합니다. 
      홀수 행인 경우 시각적으로 각 항목을 구분하는 Divider 위젯을 추가합니다. 
      작은 기기에서는 구분선을 보기 어려울 수 있습니다.*/ 
      itemBuilder: (context, i) {
        /* 2. ListView의 각 행 앞에 1 픽셀 높이의 구분선 위젯을 추가하십시오. */
        if (i.isOdd) return Divider(); //Divider : 항목 구분위젯

        /* 3. i ~/ 2 표현식은 i를 2로 나눈 뒤 정수 결과를 반환합니다.*/
        final index = i ~/ 2; 
        if (index >= _suggestions.length) {
          /* 4. 가능한 단어 쌍을 모두 사용하고 나면, 10개를 더 생성하고 제안 목록에 추가합니다.*/
          _suggestions.addAll(generateWordPairs().take(10)); 
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}