CREATE TABLE docs02 (id SERIAL, doc TEXT, PRIMARY KEY(id));

CREATE TABLE invert02 (
  keyword TEXT,
  doc_id INTEGER REFERENCES docs02(id) ON DELETE CASCADE
);

INSERT INTO docs02 (doc) VALUES
('Machine language seems quite simple on the surface given that there are'),
('only zeros and ones but its syntax is even more complex and far more'),
('intricate than Python So very few programmers ever write machine'),
('language Instead we build various translators to allow programmers to'),
('write in highlevel languages like Python or JavaScript and these'),
('translators convert the programs to machine language for actual'),
('execution by the CPU'),
('Since machine language is tied to the computer hardware machine'),
('language is not portable across different types of'),
('hardware Programs written in highlevel languages can be moved between');

CREATE TABLE stop_words (word TEXT unique);

INSERT INTO stop_words (word) VALUES 
('i'), ('a'), ('about'), ('an'), ('are'), ('as'), ('at'), ('be'), 
('by'), ('com'), ('for'), ('from'), ('how'), ('in'), ('is'), ('it'), ('of'), 
('on'), ('or'), ('that'), ('the'), ('this'), ('to'), ('was'), ('what'), 
('when'), ('where'), ('who'), ('will'), ('with');
