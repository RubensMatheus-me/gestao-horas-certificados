
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

final create_table_certificados1 = '''
  CREATE TABLE matter(
    id INTEGER NOT NULL PRIMARY KEY,
    ensino_certificado_nome VARCHAR(100) NOT NULL, 
    extensao_certificado_nome VARCHAR(100) NOT NULL,
    social_certificado_nome VARCHAR(100) NOT NULL,
    ensino_certificado_descricao VARCHAR(300),
    extensao_certificado_descricao VARCHAR(300),
    social_certificado_descricao VARCHAR(300),
    ensino_certificado_horas INTEGER NOT NULL,
    extensao_certificado_horas INTEGER NOT NULL,
    social_certificado_horas INTEGER NOT NULL,
  )
''';


final insert1 = '''
INSERT INTO matter (nome, professor, primeiro_trimestre, segundo_trimestre, terceiro_trimestre)
VALUES('Matematica', 'Hélio Kamakawa', 84.5, 67.4, 93.4);

''';


