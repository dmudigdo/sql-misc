-- Make the table
CREATE TABLE docs03 (id SERIAL, doc TEXT, PRIMARY KEY(id));

-- Populate the table
INSERT INTO docs03 (doc) VALUES
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

-- Put in filler rows
INSERT INTO docs03 (doc) SELECT 'Neon ' || generate_series(10000,20000);

-- Make the index...
CREATE INDEX array03 ON docs03 USING gin(string_to_array(lower(doc), ' ') array_ops);

-- ...such that this will work:
SELECT id, doc FROM docs03 WHERE '{programmers}' <@ string_to_array(lower(doc), ' ');

-- (and EXPLAINing it won't sequentially scan)
