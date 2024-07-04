
final create_table = '''
  CREATE TABLE matter(
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    media DOUBLE NOT NULL
  )
''';


final insert1 = '''
INSERT INTO matter (nome, media)
VALUES('Matematica', 8.5);

''';


final insert2 = '''
INSERT INTO matter (nome, media)
VALUES('Portugues', 7.0);

''';


final insert3 = '''
INSERT INTO matter (nome, media)
VALUES('Geografia', 6.0);

''';