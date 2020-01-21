PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);


DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)  
);


DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)  
);


INSERT INTO
  users(fname, lname)
VALUES
  ('Justin', 'Fang'),
  ('Songge', 'Sun'),
  ('Wilson', 'Hydro');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('SQL', 'what is SQL', (SELECT id FROM users WHERE fname='Justin' AND lname='Fang')),
  ('123', 'how are you', (SELECT id FROM users WHERE fname='Justin' AND lname='Fang')),
  ('hi', 'what time is class', (SELECT id FROM users WHERE fname='Justin' AND lname='Fang')),
  ('test', 'testeste', (SELECT id FROM users WHERE fname='Justin' AND lname='Fang'));

INSERT INTO
  question_follows(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title='SQL'), (SELECT id FROM users WHERE fname='Songge' AND lname='Sun')),
  ((SELECT id FROM questions WHERE title='hi'), (SELECT id FROM users WHERE fname='Songge' AND lname='Sun')),
  ((SELECT id FROM questions WHERE title='hi'), (SELECT id FROM users WHERE fname='Wilson' AND lname='Hydro')),
  ((SELECT id FROM questions WHERE title='123'), (SELECT id FROM users WHERE fname='Justin' AND lname='Fang'));

INSERT INTO
  replies(body, question_id, parent_id, user_id)
VALUES
  ('i don''t know', (SELECT id FROM questions WHERE title='SQL'), NULL, (SELECT id FROM users WHERE fname='Songge' AND lname='Sun')),
  ('not sure', (SELECT id FROM questions WHERE title='hi'), NULL, (SELECT id FROM users WHERE fname='Songge' AND lname='Sun')),
  ('good', (SELECT id FROM questions WHERE title='SQL'), NULL, (SELECT id FROM users WHERE fname='Wilson' AND lname='Hydro'));

INSERT INTO
  question_likes(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title='SQL'), (SELECT id FROM users WHERE fname='Songge' AND lname='Sun')),
  ((SELECT id FROM questions WHERE title='123'), (SELECT id FROM users WHERE fname='Songge' AND lname='Sun')),
  ((SELECT id FROM questions WHERE title='hi'), (SELECT id FROM users WHERE fname='Songge' AND lname='Sun')),
  ((SELECT id FROM questions WHERE title='hi'), (SELECT id FROM users WHERE fname='Justin' AND lname='Fang')),
  ((SELECT id FROM questions WHERE title='hi'), (SELECT id FROM users WHERE fname='Wilson' AND lname='Hydro')),
  ((SELECT id FROM questions WHERE title='123'), (SELECT id FROM users WHERE fname='Wilson' AND lname='Hydro'));