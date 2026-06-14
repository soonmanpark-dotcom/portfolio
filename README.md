# 김수민 · Marketing Specialist — 포트폴리오

단일 정적 HTML 포트폴리오입니다. 라이트/다크 모드 토글을 지원합니다.

## 구성
- `index.html` — 포트폴리오 본문 (CSS·JS 모두 내장, 외부 의존성 없음)
- `vercel.json` — Vercel 배포 설정 (clean URL, 캐시 헤더)

## 로컬에서 보기
`index.html` 파일을 브라우저로 열기만 하면 됩니다. 빌드 과정 없음.

## 배포 (Vercel)
1. 이 폴더를 GitHub 저장소로 push
2. [vercel.com](https://vercel.com) → **Add New… → Project** → 해당 저장소 Import
3. 프레임워크 자동 감지: **Other (정적)** — 별도 빌드 설정 불필요
4. **Deploy** → `https://<프로젝트명>.vercel.app` 발급

> 정적 사이트라 빌드 명령·출력 디렉터리 설정이 필요 없습니다. `index.html`이 루트에 있어 그대로 서빙됩니다.
