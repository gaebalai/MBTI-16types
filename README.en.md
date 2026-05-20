[한국어](README.md) | [English](README.en.md)

# MBTI-16types

A **claude.ai Agent Skill** that summons personas based on the 16 personality
types of MBTI® to clash on any topic from multiple perspectives.

Use it for **idea generation, design decisions, life / career choices, code
review, ethical dilemmas — anything where opinions are likely to diverge**. The
premise: diversity of perspective leads to better conclusions.

> **New here?** → Follow the 3 steps in [QUICKSTART.md](QUICKSTART.md) and you'll
> be up and running in 5 minutes.

## Why this exists

Asking Claude for a review tends to produce balanced, averaged answers. What you
usually want is several distinctly-biased perspectives clashing — so you can pick
up the angles you'd otherwise have missed. MBTI-16types defines **values,
thinking patterns, and tone** for each of the 16 types as independent prompts,
then hits your topic with them.

## What it does

It reads your request and runs one of three workflows.

| Workflow | Say something like | What happens |
|---|---|---|
| **solo** | "How would INTJ see this?" | One type's opinion |
| **debate** | "Have ISTJ and ENTP debate this" | Two-type debate (open → rebut → land) |
| **panel** | "Review this with all 16 types" | Every target type's opinion + synthesis |

Depth is controlled by three modes — `light` (fast), `middle` (default),
`heavy` (deep). Phrases like "quickly" or "go deep" set the mode automatically.

## Folder structure

```
MBTI-16types/
├── README.md            ← this file (project overview)
├── QUICKSTART.md        ← 3-step guide for first-time users
├── LICENSE
├── Outputs/             ← sample output log
│   └── velog-title-discussion.md
└── claude-ai-skill/     ← the skill you upload to claude.ai
    ├── README.md        ← detailed install & maintenance guide
    ├── build-zip.sh     ← builds the upload zip
    └── mbti-16types/    ← the skill itself (SKILL.md + 16 personas/)
```

## Install (summary)

1. In `claude-ai-skill/`, run `bash build-zip.sh` → produces `mbti-16types.zip`
2. claude.ai → **Settings → Capabilities → Skills → Upload skill**, pick the zip
3. In a new chat, just ask in plain language

For full steps and requirements (paid plan, etc.) see
[claude-ai-skill/README.md](claude-ai-skill/README.md); for the simplest path see
[QUICKSTART.md](QUICKSTART.md).

## Examples

### Idea generation

```
Give me 3 weekend refresh ideas from an ENFP perspective
With all 16 types, narrow down naming candidates for a new service — go deep
Pair ENTP and INFJ — what side project should I start?
```

### Design decisions / code review

```
Have INTJ check whether this API design breaks down long-term
Have ISTJ and ENTP debate deeply: split the monolith or not
Ask only INTJ, ENTJ, and ISTP which DB to adopt next
```

### Life and career choices

```
With all 16 types — change jobs, or wait for a promotion here?
INFJ vs ENTJ, go deep — turn the side project into the main gig?
```

Sample output: [`Outputs/velog-title-discussion.md`](Outputs/velog-title-discussion.md)
— a full log of running the panel workflow on a velog article title
(first-pass table → deep-dive → synthesis landing on 3 candidates).

## The 16 types

`intj` `intp` `entj` `entp` `infj` `infp` `enfj` `enfp`
`istj` `isfj` `estj` `esfj` `istp` `isfp` `estp` `esfp`

Each type's personality is defined in
[`claude-ai-skill/mbti-16types/personas/`](claude-ai-skill/mbti-16types/personas/)
as `<type>.md`. Cognitive functions (dominant + auxiliary), core values,
strengths and weaknesses, debate quirks, and characteristic phrasings are all
spelled out — so the output has visible individuality.

## Design notes

- **Personas are single-sourced in their files.** No centralized "value vector
  table" — avoids dual maintenance.
- **Each first-pass opinion is independent.** When voicing a type, only that
  type's persona file and the topic are used as grounds; other types' outputs
  must not leak in.
- **Output is shown verbatim.** No summarizing, softening, or paraphrasing (it
  would erase the personality).
- **Synthesis follows a fixed 4-part rubric.** Score distribution / axes of
  disagreement / easily-overlooked perspectives / landing-zone candidates — a
  fixed structure to keep the discussion from going scattershot.

## License

[MIT](LICENSE) © Jaewoo Kim

## Trademark notice

This skill is not affiliated with, endorsed by, or authorized by The Myers &
Briggs Foundation (holder of the Myers-Briggs Type Indicator® / MBTI®
trademark), nor by NERIS Analytics (16Personalities®). The "16 types" are
referenced as a general psychological typology.
