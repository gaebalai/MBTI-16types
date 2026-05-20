# MBTI-16types — claude.ai Agent Skill (설치·유지보수 안내)

이 폴더는 [claude.ai](https://claude.ai)에 업로드하는 **에이전트 스킬** 본체와
패키징 도구를 담고 있습니다. 가장 간단한 시작 안내는 프로젝트 루트의
[QUICKSTART.md](../QUICKSTART.md)를 보세요.

## 폴더 구조

```
claude-ai-skill/
├── README.md            ← 지금 이 파일
├── build-zip.sh         ← 업로드용 zip을 만드는 스크립트
└── mbti-16types/        ← 이 폴더 전체가 "스킬" 본체 (zip 대상)
    ├── SKILL.md         ← 스킬 본문 (발동 조건 + 3워크플로 + 출력 포맷 명세)
    └── personas/        ← 16타입 인격 정의 (intj.md … esfp.md)
```

## 설치 방법 (claude.ai)

> **준비물**: claude.ai 유료 플랜(Pro / Max / Team / Enterprise) 계정.
> 스킬 기능은 코드 실행(Code execution) 환경 위에서 동작하므로, 설정에서
> 코드 실행/스킬 기능이 켜져 있어야 합니다. (조직 계정은 관리자 허용이 필요할 수 있음)

### 1단계 — zip 파일 만들기

이 폴더(`claude-ai-skill/`)에서 아래 명령을 실행하면 `mbti-16types.zip`이 생깁니다.

```bash
bash build-zip.sh
```

스크립트를 못 쓰는 환경이면, `mbti-16types` **폴더 자체**를 압축해도 됩니다.
(zip 안에 `mbti-16types/SKILL.md` 경로가 보이도록 폴더째 압축하세요.)

### 2단계 — claude.ai에 업로드

1. claude.ai에 로그인 → 좌측 하단 **설정(Settings)** 클릭
2. **Capabilities(기능)** → **Skills(스킬)** 메뉴로 이동
3. **Upload skill(스킬 업로드)** 버튼을 누르고 `mbti-16types.zip` 선택
4. 목록에 `mbti-16types`가 나타나면 완료. (켜짐 상태인지 확인)

> 메뉴 이름은 claude.ai 업데이트에 따라 조금씩 다를 수 있습니다.
> "Skills" 또는 "스킬" 항목에서 업로드하면 됩니다.

### 3단계 — 사용

새 대화에서 **그냥 말로** 요청하면 Claude가 알아서 이 스킬을 발동합니다.
슬래시 커맨드를 외울 필요가 없습니다.

```
ENTP라면 이 신규 서비스 네이밍을 어떻게 볼까?
ISTJ랑 ENTP를 붙여서 모놀리스 분할 문제로 토론시켜줘
16유형 전체 관점으로 이 velog 글 제목 후보를 좁혀줘
여러 관점에서 깊게(heavy) — 이직할까, 지금 회사에서 승진을 기다릴까?
INTJ·ENTJ·ISTP 세 유형한테만 다음에 채택할 DB를 물어봐
```

- **워크플로**: 유형 1개=solo, 2개=debate, "전부/16유형/여러 관점"=panel 로 자동 판별
- **모드**: "간단히/빠르게"=light, 기본=middle, "깊게/자세히/제대로"=heavy
- **저장**: 결과를 파일로 남기고 싶으면 "결과 파일로 저장해줘"라고 덧붙이면 됩니다

## 동작 방식

- 스킬이 발동하면 `SKILL.md`가 Claude에게 로드됩니다(발동 조건·워크플로·포맷 명세).
- 각 유형을 연기하기 직전, Claude가 `personas/<type>.md`를 읽어 그 인격을 따릅니다.
- claude.ai에는 subagent가 없으므로, 16유형 패널도 Claude가 각 페르소나를
  **순서대로 직접 연기**합니다. 한 유형을 쓸 때는 그 유형의 페르소나 파일과 주제만
  근거로 삼아, 다른 유형의 의견이 새어 들어가지 않도록 독립적으로 작성합니다.

## 유지보수 메모

- **16타입 인격의 단일 출처는 `mbti-16types/personas/<type>.md`** 입니다.
  인격(가치관·말투 등)을 고치려면 이 파일만 수정하면 됩니다.
- **워크플로·출력 포맷의 단일 출처는 `mbti-16types/SKILL.md`** 입니다.
- 파일을 수정한 뒤에는 `bash build-zip.sh`로 zip을 다시 만들어 재업로드하세요.
- 스킬 이름(`name: mbti-16types`)은 소문자·하이픈만 허용됩니다. 폴더명도 동일하게
  맞춰 두는 것이 좋습니다.

## 라이선스

[MIT](../LICENSE) © Jaewoo Kim

## 상표에 대하여

이 스킬은 Myers-Briggs Type Indicator® (MBTI®)의 권리자인 The Myers & Briggs
Foundation, 및 16Personalities®를 제공하는 NERIS Analytics와는 무관하며,
그들로부터 인가·추천을 받은 것이 아닙니다. '16타입'은 심리학 일반에서 쓰이는
유형 표현으로서 참조하고 있습니다.
