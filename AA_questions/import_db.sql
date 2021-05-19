PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    parent_reply_id INTEGER,


    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    upvotes INTEGER NOT NULL,
    question_follows_id INTEGER NOT NULL;

    FOREIGN KEY (question_follows_id) REFERENCES question_follows(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Tyler', 'Bernstein'),
    ('Sam', 'Sacco');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Tyler''s question', 'TYLER TYLER TYLER', (SELECT id FROM users WHERE fname = 'Tyler')),
    ('Sam''s question', 'CATHY CAN YOU EXPLAIN...', (SELECT id FROM users WHERE fname = 'Sam'));
