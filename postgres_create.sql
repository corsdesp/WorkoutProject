CREATE TABLE "Profile" (
	"Id" serial NOT NULL,
	"login" varchar NOT NULL UNIQUE,
	"password" varchar NOT NULL,
	"first name" varchar NOT NULL,
	"last name" varchar NOT NULL,
	"id_group" int NOT NULL,
	"sex" BOOLEAN NOT NULL,
	"email" varchar NOT NULL UNIQUE,
	CONSTRAINT Profile_pk PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Diet" (
	"id" serial NOT NULL,
	"id_profile" bigint NOT NULL,
	"name" varchar NOT NULL,
	"date" TIMESTAMP NOT NULL,
	CONSTRAINT Diet_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Workout" (
	"id" serial NOT NULL,
	"id_profile" bigint NOT NULL,
	"id_type_of_training" bigint NOT NULL,
	"reps" int NOT NULL,
	"sets" int NOT NULL,
	"weight" int NOT NULL,
	"time_relax" TIME NOT NULL,
	"day_of_week" TIMESTAMP NOT NULL,
	CONSTRAINT Workout_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Group" (
	"id" serial NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT Group_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Types_of_training" (
	"id" serial NOT NULL,
	"id_parts_of_body" bigint NOT NULL,
	"name" varchar NOT NULL UNIQUE,
	"description" TEXT NOT NULL,
	"video_link" varchar NOT NULL,
	CONSTRAINT Types_of_training_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Parts_of_the_body" (
	"id" bigint NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT Parts_of_the_body_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Profile" ADD CONSTRAINT "Profile_fk0" FOREIGN KEY ("id_group") REFERENCES "Group"("id");

ALTER TABLE "Diet" ADD CONSTRAINT "Diet_fk0" FOREIGN KEY ("id_profile") REFERENCES "Profile"("Id");

ALTER TABLE "Workout" ADD CONSTRAINT "Workout_fk0" FOREIGN KEY ("id_profile") REFERENCES "Profile"("Id");
ALTER TABLE "Workout" ADD CONSTRAINT "Workout_fk1" FOREIGN KEY ("id_type_of_training") REFERENCES "Types_of_training"("id");


ALTER TABLE "Types_of_training" ADD CONSTRAINT "Types_of_training_fk0" FOREIGN KEY ("id_parts_of_body") REFERENCES "Parts_of_the_body"("id");


