mdext
====

mdext는 md파일을 작성할 때, 반복적이고 단순한 작업들을 템플릿으로 만들어 자동화시킬 수 있는 도구입니다.

예제
----
mdext는 md의 확장 문법처럼 작동하며 아래와 같은 구조를 가지고 있습니다.
```
@[템플릿_이름](ARGV)
```

* \__file__
  ```md
  @[__file__]()
  ====
  ```
  \__file__ 템플릿은 현재 emd파일의 .emd확장자를 제외한 순수한 파일 이름으로 치환됩니다.<br>
  예를들어 __milk_and_curry.emd__파일에서 \__file__템플릿을 사용하면 __milk_and_curry__로 치환됩니다.

* tree
  ```md
  @[tree](dst)
  ```
  tree 템플릿은 지정된 디렉토리의 모든 emd 파일들의 목록으로 치환됩니다.<br>
  tree를 이용하여 자동으로 목차를 생성할 수 있습니다.

* replace
  ```md
  @[replace](hey.emd)
  ```
  replace 템플릿은 지정한 emd파일을 현재 위치에 삽입합니다.<br>

* embed
  ```md
  @[replace](hello.cpp)
  ```
  embed 템플릿은 지정된 소스 파일을 현재 위치에 삽입합니다.<br>
  샘플 소스를 마크다운에 삽입할 때, 순수한 소스와 마크다운을 분리할 수 있고, 소스가 변경될때마다 매번 md파일까지 수정하지 않아도 되도록 도와줍니다.


사용하기
----
[observr](https://github.com/kevinburke/observr)을 설치합니다.
```
gem install observr
```
레포지토리가 있는 폴더로 이동 후 아래의 명령을 실행합니다.
```
observr mdext.observr
```
즉시 레포지토리의 모든 emd파일로부터 md파일이 생성되며
이후에 emd파일의 변화를 자동으로 감지하여 실시간으로 md파일에 반영시킵니다.


커스텀 템플릿 추가하기
----
