### 네이밍

- 자바 변수명은 camelcase : trDt
- DB 컬럼명은 snakecase: TR_DT
- mybatis 설정 중 케이스변환 설정이 있어서 해당 설정을 적용하면 알아서 db 컬럼을 자바 변수로 매핑해준다.


- DTO: 리스트 검색조건용 객체. 검색조건과 페이징을 담당한다. pagingDto를 상속받아 사용한다.
- Info: 뷰페이지에 값 전달용 객체. 실제 db에서 select한 값을 이 객체에 담는다.
- mapper: mapper 이름 작성 시 select, update, insert, delete 등 SQL에서 사용하는 키워드를 접두사로 사용한다.
  - 더불어 단건의 경우 단수명으로, 리스트조회인 경우 -s를 붙여 표현한다.
  - selectTrHistory(단건), selectTrHistories(여러건)
- service: mapper에서 사용한 접두사를 그대로 사용하지 않으며, 아래와 같이 변경한다.
  - select - find
  - insert - add
  - update - modify
  - delete - remove
- 자세한 컨벤션의 경우 블로그 참고 https://cocobi.tistory.com/27

### 파일

- jsp 파일 경로의 경우 메뉴리스트를 따라간다. 대메뉴-소메뉴
  - 예: 거래관리 - 거래내역 - 리스트
  - transaction - TrHistory - list.jsp
- java 파일 경로의 경우 상위 패키지를 대메뉴 이름을 사용한다.
  - 예: 거래관리 -> transaction
  - 대메뉴 하단으로 컨트롤러, 서비스 등을 패키지로 배치한 후 파일을 생성한다.
  - 예외적으로 common, handler, config 등의 경우 대메뉴와 같은 취급으로 같은 열에 위치한다.
    - 예: common, handler, config, transaction, organization, ...

