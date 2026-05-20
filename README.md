[한국어](README.md) | [English](README.en.md)

# MBTI-16types

MBTI® 16가지 성격 유형의 인격(페르소나)을 소환해, 어떤 주제든 여러 시점에서
부딪치게 하는 **claude.ai Agent Skill(에이전트 스킬)**.

**아이디어 도출·설계 판단·라이프/커리어 선택·코드 리뷰·윤리적 토픽 등, 의견이 갈릴 만한
모든 주제**에 쓸 수 있습니다. 시점의 다양성이 더 나은 결론으로 이어진다는 전제로
디자인되었습니다.

> **처음이신가요?** → [QUICKSTART.md](QUICKSTART.md) 의 3단계만 따라 하면
> 5분 안에 쓸 수 있습니다.

## 왜 만들었나

Claude에게 그냥 리뷰를 부탁하면, 무난하고 평균적인 답이 돌아오기 쉽습니다. 정말
원하는 것은, 입장이 다른 여러 인격이 **의도적으로 치우친 의견**을 부딪쳐 본 결과로부터,
자신이 놓치고 있던 시점을 줍는 것입니다. MBTI-16types는 그를 위해, 16타입 각각의
**가치관·사고 경향·말투**를 독립된 프롬프트로 정의하고, 하나의 주제에 부딪칩니다.

## 무엇을 하나

요청을 보고 3가지 워크플로 중 하나로 동작합니다.

| 워크플로 | 이렇게 말하면 | 동작 |
|---|---|---|
| **solo** | "INTJ는 이거 어떻게 볼까" | 한 유형의 의견 |
| **debate** | "ISTJ랑 ENTP 토론시켜줘" | 두 유형의 디베이트(입론 → 반론 → 착지) |
| **panel** | "16유형 전체로 검토해줘" | 대상 유형 전원의 의견 + 합의 |

깊이는 3가지 모드로 조절합니다 — `light`(빠르게), `middle`(기본), `heavy`(깊게).
말투에 "간단히 / 깊게" 같은 표현을 섞으면 자동으로 모드가 정해집니다.

## 폴더 구조

```
MBTI-16types/
├── README.md            ← 지금 이 파일 (프로젝트 개요)
├── QUICKSTART.md        ← 처음 사용자용 3단계 안내
├── LICENSE
├── Outputs/             ← 출력 예시 로그
│   └── velog-title-discussion.md
└── claude-ai-skill/     ← claude.ai에 업로드하는 스킬
    ├── README.md        ← 설치·유지보수 상세 안내
    ├── build-zip.sh     ← 업로드용 zip 생성 스크립트
    └── mbti-16types/    ← 스킬 본체 (SKILL.md + personas/ 16개)
```

## 설치 (요약)

1. `claude-ai-skill/` 폴더에서 `bash build-zip.sh` 실행 → `mbti-16types.zip` 생성
2. claude.ai → **설정 → Capabilities → Skills → Upload skill** 에서 zip 업로드
3. 새 대화에서 그냥 말로 요청

자세한 단계와 준비물(유료 플랜 등)은 [claude-ai-skill/README.md](claude-ai-skill/README.md),
가장 간단한 안내는 [QUICKSTART.md](QUICKSTART.md)를 보세요.

## Claude Code에서 쓰고 싶다면

이 저장소는 **claude.ai용 Agent Skill** 버전입니다.
[Claude Code](https://claude.com/claude-code)에서 쓰고 싶다면, 같은 16유형 기능을
**플러그인**으로 설치할 수 있습니다.

```
/plugin marketplace add gaebalai/claudecode-to
/plugin install mbti-16types@claudecode.to
```

설치하면 zip 업로드 없이 `/mind` · `/pair` · `/minds` 슬래시 커맨드로 바로 쓸 수 있습니다.

## 사용 예

### 아이디어 도출

```
ENFP 관점에서 이번 주말 리프레시 안 3개 내줘
16유형 전체로, 신규 서비스 네이밍 후보를 깊게 좁혀줘
ENTP랑 INFJ 붙여서 — 부업으로 뭘 시작할까?
```

### 설계 판단 / 코드 리뷰

```
INTJ는 이 API 설계가 장기적으로 파탄날지 봐줘
ISTJ랑 ENTP를 깊게 토론시켜줘, 주제는 모놀리스 분할 여부
INTJ·ENTJ·ISTP 세 유형한테만 다음에 채택할 DB를 물어봐
```

### 라이프·커리어 선택

```
16유형 관점에서 — 이직할까, 지금 회사에서 승진을 기다릴까?
INFJ vs ENTJ로 깊게 — 부업을 본업화할까?
```

출력 예시: [`Outputs/velog-title-discussion.md`](Outputs/velog-title-discussion.md) —
velog 글 제목을 panel 워크플로로 논의한 완전 로그(1차 평가표 → 심층 분석 → 합의 3안).

## 16개 유형

`intj` `intp` `entj` `entp` `infj` `infp` `enfj` `enfp`
`istj` `isfj` `estj` `esfj` `istp` `isfp` `estp` `esfp`

각 유형의 인격은 [`claude-ai-skill/mbti-16types/personas/`](claude-ai-skill/mbti-16types/personas/)
의 `<type>.md`에 정의돼 있습니다. 주기능·부기능을 포함한 인지 특성, 가치관의 핵심,
강점·약점, 논의 버릇, 전형적 말투까지 명시돼 있어 출력에 시각적 개성이 드러납니다.

## 설계 메모

- **인격은 페르소나 파일이 단일 출처.** 중앙집권적 '가치관 벡터 표' 같은 데이터 구조는
  두지 않습니다(이중 관리를 피하기 위해).
- **각 1차 의견은 독립적으로.** 한 유형을 쓸 때는 그 유형의 페르소나 파일과 주제만
  근거로 삼아, 다른 유형의 의견이 새어 들어가지 않게 합니다.
- **출력은 가공하지 않고 그대로.** 요약·순화·바꿔 말하기는 금지(인격의 말투가 사라지므로).
- **합의는 4개 섹션 고정 루브릭.** score 분포 / 주요 대립축 / 놓치기 쉬운 시점 /
  절충점 후보 — 발산을 막기 위한 정형 구조입니다.

## 라이선스

[MIT](LICENSE) © Jaewoo Kim

## 상표에 대하여

이 스킬은 Myers-Briggs Type Indicator® (MBTI®)의 권리자인 The Myers & Briggs
Foundation, 및 16Personalities®를 제공하는 NERIS Analytics와는 무관하며, 그들로부터
인가·추천을 받은 것이 아닙니다. '16타입'은 심리학 일반에서 쓰이는 유형 표현으로서
참조하고 있습니다.
