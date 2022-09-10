## 기본

- main() 메서드는 화살표(=>) 표기법을 사용합니다. 한 줄 함수 또는 메서드에 화살표 표기법을 사용하세요.
- 앱은 StatelessWidget을 상속받아 앱 자체를 위젯으로 만듭니다. Flutter에서는 정렬, 여백, 레이아웃 등 거의 모든것이 위젯입니다.
- 머티리얼 라이브러리의 Scaffold 위젯은 홈 스크린의 위젯 트리를 구성하는 app bar, title, body 속성을 기본으로 제공합니다.
- 위젯 하위 트리는 상당히 복잡할 수 있습니다.
- 위젯의 주된 임무는 다른 하위 위젯을 어떻게 표현할 지를 설명하는 build() 메서드를 제공하는 것입니다.
- Stateless 위젯은 변경 불가능(immutable)합니다.
  - 속성을 변경할 수 없습니다—모든 값이 final입니다.
  - Stateful 위젯은 위젯의 수명동안 변경될 수 있는 상태를 유지합니다. Stateful 위젯은 최소 두 개 이상 클래스가 필요합니다.
  1. StatefulWidget 클래스가
  2. State 클래스 의 인스턴스를 생성합니다.
     - StatefulWidget 클래스 그자체는 변경불가능합니다. 하지만 State 클래스가 위젯의 수명동안 상태를 유지합니다.
- Dart 언어에서는 식별자 앞에 밑줄(\_)을 붙이면 프라이빗 적용이 됩니다.
- setState()를 호출하면 State 객체에 대한 build() 메서드에 대한 호출이 트리거되어 UI가 업데이트됩니다.

## 외부패키지 사용

- Flutter 앱에서 의존성 및 asset 관리는 pubspec 파일이 담당
  - 추가 후 $ flutter pub get 실행

## 클래스

- ListView 클래스는 builder 속성인 itemBuilder를 제공합니다
