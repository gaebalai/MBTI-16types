#!/usr/bin/env bash
# claude.ai에 업로드할 스킬 zip(mbti-16types.zip)을 만든다.
set -euo pipefail
cd "$(dirname "$0")"

SKILL_DIR="mbti-16types"
ZIP_NAME="mbti-16types.zip"

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  echo "오류: $SKILL_DIR/SKILL.md 를 찾을 수 없습니다." >&2
  exit 1
fi

rm -f "$ZIP_NAME"
# OS/에디터 부산물은 제외하고 스킬 폴더째 압축
zip -r -X "$ZIP_NAME" "$SKILL_DIR" \
  -x '*.DS_Store' -x '__MACOSX*' -x '*/.*' >/dev/null

echo "생성 완료: $(pwd)/$ZIP_NAME"
echo "내용:"
unzip -l "$ZIP_NAME"
