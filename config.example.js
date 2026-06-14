// config.example.js — 커밋용 템플릿 (실제 키 없음)
//
// 사용법:
//  1) 이 파일을 복사해서 같은 폴더에 config.js 로 이름 변경
//  2) 아래 값을 본인 Supabase 프로젝트 값으로 채움
//  3) config.js 는 .gitignore 에 등록되어 커밋되지 않음
//
// ※ anon key 는 브라우저에 공개되도록 설계된 "공개 키" 입니다.
//    실제 보안은 Supabase RLS 정책이 담당합니다. (service_role 키는 절대 넣지 마세요)

window.SUPABASE_CONFIG = {
  url: "https://YOUR-PROJECT-ref.supabase.co",
  anonKey: "YOUR-ANON-KEY",
};
