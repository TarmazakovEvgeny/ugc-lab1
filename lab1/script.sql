CREATE TABLE halls
(
  shortName text NOT NULL,
  fullName text NOT NULL,
  CONSTRAINT "pkHalls" PRIMARY KEY (shortName)
)

CREATE TABLE stillage
(
  id integer NOT NULL,
  hallName text NOT NULL,
  CONSTRAINT "pkStillage" PRIMARY KEY (id),
  CONSTRAINT "fkStillage" FOREIGN KEY (hallName)
      REFERENCES halls (shortName)
)

CREATE TABLE books
(
  name text NOT NULL,
  authors text[] NOT NULL,
  tome integer NOT NULL,
  part integer NOT NULL,
  isbn text NOT NULL,
  year integer NOT NULL,
  stillageId integer NOT NULL,
  shelf integer NOT NULL,
  count integer NOT NULL,
  CONSTRAINT "pkBook" PRIMARY KEY (name),
  CONSTRAINT "fkBook" FOREIGN KEY (stillageId)
      REFERENCES stillage (id),
  CONSTRAINT "cuISBN" UNIQUE (isbn)
)
