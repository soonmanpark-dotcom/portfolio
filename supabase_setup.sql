-- ============================================================
-- 방명록(messages) 테이블 + RLS 설정
-- 실행 위치: Supabase 대시보드 → 좌측 메뉴 "SQL Editor" → 새 쿼리에 붙여넣고 Run
-- (anon key 로는 테이블을 만들 수 없으므로 대시보드에서 실행해야 합니다)
-- ============================================================

-- 1) 테이블 생성
create table if not exists public.messages (
  id          uuid        primary key default gen_random_uuid(),
  name        text        not null,
  content     text        not null,
  created_at  timestamptz not null default now()
);

-- 2) 가벼운 입력값 보호 (빈 글 / 과도하게 긴 글 방지)
alter table public.messages
  add constraint messages_name_len    check (char_length(name) between 1 and 50),
  add constraint messages_content_len check (char_length(content) between 1 and 1000);

-- 3) 최신순 조회 성능을 위한 인덱스
create index if not exists messages_created_at_idx
  on public.messages (created_at desc);

-- 4) RLS(행 단위 보안) 활성화 — 켜는 순간 기본은 전부 차단됨
alter table public.messages enable row level security;

-- 5) 누구나 읽기 허용 (anon = 비로그인, authenticated = 로그인)
create policy "누구나 읽기 가능"
  on public.messages
  for select
  to anon, authenticated
  using (true);

-- 6) 누구나 작성 허용
create policy "누구나 작성 가능"
  on public.messages
  for insert
  to anon, authenticated
  with check (true);

-- ※ update / delete 정책은 일부러 두지 않음 → RLS 기본 차단으로
--    아무도 남의 글을 수정/삭제할 수 없음 (방명록에 적절한 동작)
