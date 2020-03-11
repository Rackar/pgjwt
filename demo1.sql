

create schema api;

create table api.articles (
  id serial primary key,
  userid serial not null,
  title text,
  content text,
  show boolean not null default true,
  createdAt timestamptz  default current_timestamp
);

insert into api.articles (userid,title,content) values
  (1,'第一篇文章标题','内容'), (1,'第二篇标题','内容2');

select * from api.articles;

create role web_anon nologin;

grant usage on schema api to web_anon;
grant select on api.articles to web_anon;
create role authenticator noinherit login password 'mypassword';
grant web_anon to authenticator;
create role auth_user nologin;
grant auth_user to authenticator;
grant usage on schema api to auth_user;
grant all on api.articles to auth_user;
grant usage, select on sequence api.articles_id_seq to auth_user;