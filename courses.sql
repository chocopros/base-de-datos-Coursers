CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "id_roles" int NOT NULL,
  "is_active" bool DEFAULT true
);

CREATE TABLE "courses" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text,
  "level" int DEFAULT 1,
  "id_user" uuid NOT NULL,
  "id_categories" int NOT NULL
);

CREATE TABLE "courses_video" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "url" varchar NOT NULL,
  "upload_date" date,
  "id_user" uuid NOT NULL,
  "id_course" int NOT NULL
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "type" varchar
);

CREATE TABLE "roles" (
  "id" SERIAL PRIMARY KEY,
  "type" varchar
);

CREATE TABLE "users_courses" (
  "id" SERIAL,
  "id_user" uuid NOT NULL,
  "id_course" int NOT NULL,
  "percent_complete" int,
  "complete" bool DEFAULT false,
  "review" int DEFAULT 0
);

ALTER TABLE "users" ADD FOREIGN KEY ("id_roles") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_categories") REFERENCES "categories" ("id");

ALTER TABLE "courses_video" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "courses_video" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

