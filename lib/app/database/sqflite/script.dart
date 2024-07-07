
final create_table_materias = '''
  CREATE TABLE matter(
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    professor VARCHAR(30) NOT NULL,
    primeiro_trimestre DOUBLE NOT NULL,
    segundo_trimestre DOUBLE NOT NULL,
    terceiro_trimestre DOUBLE NOT NULL,
    media DOUBLE 
  )
''';

final create_table_certificados = '''
  CREATE TABLE certificate(
    id INTEGER NOT NULL PRIMARY KEY,
    nome_certificado VARCHAR(50) NOT NULL,
    descricao_certificado VARCHAR(200),
    horas_certificado INTEGER NOT NULL,
    tipo_certificado VARCHAR(10) NOT NULL
  )
''';


final insert1 = '''
INSERT INTO matter (nome, professor, primeiro_trimestre, segundo_trimestre, terceiro_trimestre)
VALUES('Matematica', 'Hélio Kamakawa', 84.5, 67.4, 93.4);

''';

final insert_certificado = '''
INSERT INTO certificate (nome_certificado, descricao_certificado, horas_certificado, tipo_certificado) 
VALUES('Curso SQL', 'Curso realizado no periodo da pandemia', 20, 'Extensao');
''';

