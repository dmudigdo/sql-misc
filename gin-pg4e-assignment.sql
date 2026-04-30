CREATE TABLE docs01 (id SERIAL, doc TEXT, PRIMARY KEY(id));

CREATE TABLE invert01 (
  keyword TEXT,
  doc_id INTEGER REFERENCES docs01(id) ON DELETE CASCADE
);

INSERT INTO docs01 (doc) VALUES
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

SELECT id, unnest(string_to_array(doc, ' ')) AS keyword
FROM docs01
ORDER BY id;

INSERT INTO invert01 (doc_id, keyword)
SELECT DISTINCT id, s.keyword AS keyword
FROM docs AS D, unnest(string_to_array(D.doc, ' ')) s(keyword)
ORDER BY id;
