create table cliente5
(cpf_clie number(11) primary key,
nm_clie varchar(200) not null,
email_clie varchar(200) not null)

create table funcionario5
(id_fun number(7) primary key,
nm_fun varchar(200) not null,
salario number(10,2) not null)

create table servico5
(id_servico number(7) primary key,
locar_serv varchar(200) not null,
dt_serv date not null)

create table quarto5
(id_quarto number(7) primary key,
diaria number(10,2) not null,
ds_quarto number(10,2) not null)

create table estadia5
(id_estadia number(7) primary key,
dt_entr date not null,
dt_said date not null)

CREATE TABLE pertence5 (
  id_pertence NUMBER(7) PRIMARY KEY,
  id_estadia NUMBER(7),
  id_quarto NUMBER(7),
  CONSTRAINT fk_estadia FOREIGN KEY (id_estadia) REFERENCES estadia5(id_estadia),
  CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quarto5(id_quarto)
);

CREATE TABLE Culinaria (
    Id_Culinaria NUMBER(2) CONSTRAINT PK_Culinaria PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);
 
CREATE TABLE Categoria_Artigo (
    Id_CategoriaArtigo NUMBER(2) CONSTRAINT PK_CategoriaArtigo PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL
);
 
CREATE TABLE Praticas_Sustentaveis (
    Id_Praticas_Sustentaveis NUMBER(2) CONSTRAINT PK_PraticasSustentaveis PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(300) NOT NULL
);
 
CREATE TABLE Usuario (
    Id_Usuario NUMBER(4) CONSTRAINT PK_Usuario PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Senha VARCHAR(30) NOT NULL,
    Email VARCHAR(40) NOT NULL,
    TipoUsuario CHAR(1) NOT NULL
);
 
CREATE TABLE Restaurante (
    CNPJ NUMBER(14) CONSTRAINT PK_Restaurante PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(1000) NOT NULL,
    Fk_Id_Culinaria NUMBER(2) CONSTRAINT FK_Restaurante_Culinaria REFERENCES Culinaria
);
 
CREATE TABLE Unidade (
    Id_Unidade NUMBER(2) CONSTRAINT PK_Unidade PRIMARY KEY,
    Imagem VARCHAR(100) NOT NULL,
    CEP CHAR(8) NOT NULL,
    Rua VARCHAR(150) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Fk_Restaurante NUMBER(14) CONSTRAINT FK_Unidade_Restaurante REFERENCES Restaurante
);
 
CREATE TABLE Avaliacao (
    Id_Avaliacao NUMBER(4) CONSTRAINT PK_Avaliacao PRIMARY KEY,
    Valor NUMBER(2) NOT NULL,
    Momento DATE NOT NULL,
    Fk_Restaurante_CNPJ NUMBER(14) CONSTRAINT FK_Avaliacao_Restaurante REFERENCES Restaurante,
    Fk_IdUsuario NUMBER(4) CONSTRAINT FK_Avaliacao_Usuario REFERENCES Usuario
);
 
CREATE TABLE Comentario_Restaurante (
    Id_Comentario_Restaurante NUMBER(4) CONSTRAINT PK_ComentarioRestaurante PRIMARY KEY,
    Texto VARCHAR(400) NOT NULL,
    Data DATE NOT NULL,
    Fk_IdUsuario NUMBER(4) CONSTRAINT FK_Comentario_Restaurante_Usuario REFERENCES Usuario,
    Fk_Restaurante_CNPJ NUMBER(14) CONSTRAINT FK_Comentario_Restaurante_Restaurante REFERENCES Restaurante
);
 
CREATE TABLE Artigo (
    Id_Artigo NUMBER(3) CONSTRAINT PK_Artigo PRIMARY KEY,
    Titulo VARCHAR(80) NOT NULL,
    Texto VARCHAR(4000) NOT NULL,
    Imagem VARCHAR(200) NOT NULL,
    Data DATE NOT NULL,
    Fk_Id_Categoria_Artigo NUMBER(2) CONSTRAINT FK_Artigo_Categoria_Artigo REFERENCES Categoria_Artigo
);
 
CREATE TABLE Comentario_Artigo (
    Id_Comentario_Artigo NUMBER(4) CONSTRAINT PK_ComentarioArtigo PRIMARY KEY,
    Texto VARCHAR(400) NOT NULL,
    Data DATE NOT NULL,
    Fk_Id_Usuario NUMBER(4) CONSTRAINT FK_Comentario_Artigo_Usuario REFERENCES Usuario,
    Fk_Id_Artigo NUMBER(3) CONSTRAINT FK_Comentario_Artigo_Artigo REFERENCES Artigo
);
 
CREATE TABLE Restaurante_PraticasSustentaveis (
    Fk_Restaurante_CNPJ NUMBER(14) CONSTRAINT FK_Restaurante_PraticasSustentaveis_Restaurante REFERENCES Restaurante,
    Fk_Id_Praticas_Sustentaveis NUMBER(2) CONSTRAINT FK_Restaurante_PraticasSustentaveis_PraticasSustentaveis REFERENCES Praticas_Sustentaveis
);
 
CREATE TABLE Curte (
    Fk_Id_Artigo NUMBER(3) CONSTRAINT FK_Curte_Artigo REFERENCES Artigo,
    Fk_Id_Usuario NUMBER(4) CONSTRAINT FK_Curte_Usuario REFERENCES Usuario
);
-- Populando a tabela Culinaria
INSERT INTO Culinaria VALUES (1, 'Italiana');
INSERT INTO Culinaria VALUES (2, 'Chinesa');
INSERT INTO Culinaria VALUES (3, 'Mexicana');
INSERT INTO Culinaria VALUES (4, 'Indiana');
INSERT INTO Culinaria VALUES (5, 'Japonesa');
INSERT INTO Culinaria VALUES (6, 'Francesa');
INSERT INTO Culinaria VALUES (7, 'Brasileira');
INSERT INTO Culinaria VALUES (8, 'Tailandesa');
INSERT INTO Culinaria VALUES (9, 'Grega');
INSERT INTO Culinaria VALUES (10, 'Turca');

-- Populando a tabela Categoria_Artigo
INSERT INTO Categoria_Artigo VALUES (1, 'Tecnologias inovadoras');
INSERT INTO Categoria_Artigo VALUES (2, 'Agricultura sustentável');
INSERT INTO Categoria_Artigo VALUES (3, 'Combate à fome mundial');
INSERT INTO Categoria_Artigo VALUES (4, 'Escassez de alimentos');
INSERT INTO Categoria_Artigo VALUES (5, 'IA generativa');
INSERT INTO Categoria_Artigo VALUES (6, 'Agricultura vertical');
INSERT INTO Categoria_Artigo VALUES (7, 'Aquaponia');
INSERT INTO Categoria_Artigo VALUES (8, 'Hidroponia');
INSERT INTO Categoria_Artigo VALUES (9, 'Distribuição de alimentos');
INSERT INTO Categoria_Artigo VALUES (10, 'Melhorias na distribuição de alimentos');

-- Populando a tabela Praticas_Sustentaveis
INSERT INTO Praticas_Sustentaveis VALUES (1, 'Compostagem', 'Prática de reciclar resíduos orgânicos para produção de adubo natural.');
INSERT INTO Praticas_Sustentaveis VALUES (2, 'Economia de Água', 'Uso consciente da água para evitar desperdícios.');
INSERT INTO Praticas_Sustentaveis VALUES (3, 'Energia Renovável', 'Utilização de fontes de energia limpa e renovável.');
INSERT INTO Praticas_Sustentaveis VALUES (4, 'Redução de Desperdício de Alimentos', 'Medidas para evitar o desperdício de alimentos.');
INSERT INTO Praticas_Sustentaveis VALUES (5, 'Produção Local', 'Priorização de ingredientes e produtos locais.');
INSERT INTO Praticas_Sustentaveis VALUES (6, 'Uso de Embalagens Sustentáveis', 'Utilização de embalagens biodegradáveis ou recicláveis.');
INSERT INTO Praticas_Sustentaveis VALUES (7, 'Transporte Sustentável', 'Opções de transporte eco-friendly para entrega de produtos.');
INSERT INTO Praticas_Sustentaveis VALUES (8, 'Sourcing Responsável', 'Busca de fornecedores que adotem práticas sustentáveis.');
INSERT INTO Praticas_Sustentaveis VALUES (9, 'Redução de Emissões de Carbono', 'Medidas para diminuir a pegada de carbono.');
INSERT INTO Praticas_Sustentaveis VALUES (10, 'Reutilização de Materiais', 'Reutilização de materiais para reduzir o consumo de recursos naturais.');

-- Populando a tabela Usuario
INSERT INTO Usuario VALUES (1, 'Arthur', 'senha123', 'arthur@gmail.com', 'A');
INSERT INTO Usuario VALUES (2, 'Ana', 'senha123', 'ana@gmail.com', 'A');
INSERT INTO Usuario VALUES (3, 'Alicia', 'senha123', 'alicia@gmail.com', 'A');
INSERT INTO Usuario VALUES (4, 'Larah', 'senha123', 'larah@gmail.com', 'A');
INSERT INTO Usuario VALUES (5, 'Carlos', 'senha123', 'carlos@gmail.com', 'C');
INSERT INTO Usuario VALUES (6, 'Mariana', 'senha123', 'mariana@gmail.com', 'C');
INSERT INTO Usuario VALUES (7, 'Fernando', 'senha123', 'fernando@gmail.com', 'C');
INSERT INTO Usuario VALUES (8, 'Laura', 'senha123', 'laura@gmail.com', 'C');
INSERT INTO Usuario VALUES (9, 'Rafael', 'senha123', 'rafael@gmail.com', 'C');
INSERT INTO Usuario VALUES (10, 'Gabriela', 'senha123', 'gabriela@gmail.com', 'C');

-- Populando a tabela Restaurante
INSERT INTO Restaurante VALUES (12345678901234, 'Restaurante A', 'Restaurante com comida italiana tradicional.', 1);
INSERT INTO Restaurante VALUES (23456789012345, 'Restaurante B', 'Restaurante especializado em culinária chinesa.', 2);
INSERT INTO Restaurante VALUES (34567890123456, 'Restaurante C', 'Restaurante com variedade de pratos mexicanos.', 3);
INSERT INTO Restaurante VALUES (45678901234567, 'Restaurante D', 'Restaurante indiano com opções vegetarianas.', 4);
INSERT INTO Restaurante VALUES (56789012345678, 'Restaurante E', 'Restaurante japonês com sushi e sashimi.', 5);
INSERT INTO Restaurante VALUES (67890123456789, 'Restaurante F', 'Restaurante com pratos franceses refinados.', 6);
INSERT INTO Restaurante VALUES (78901234567890, 'Restaurante G', 'Restaurante com buffet de comida brasileira.', 7);
INSERT INTO Restaurante VALUES (89012345678901, 'Restaurante H', 'Restaurante com sabores tailandeses autênticos.', 8);
INSERT INTO Restaurante VALUES (90123456789012, 'Restaurante I', 'Restaurante com especialidades gregas.', 9);
INSERT INTO Restaurante VALUES (01234567890123, 'Restaurante J', 'Restaurante com pratos turcos tradicionais.', 10);

-- Populando a tabela Unidade
INSERT INTO Unidade VALUES (1, 'imagem1.jpg', '12345678', 'Rua das Flores, 123', 'São Paulo', 'SP', 'Jardim Paulista', 12345678901234);
INSERT INTO Unidade VALUES (2, 'imagem2.jpg', '23456789', 'Avenida das Palmeiras, 456', 'Rio de Janeiro', 'RJ', 'Copacabana', 23456789012345);
INSERT INTO Unidade VALUES (3, 'imagem3.jpg', '34567890', 'Rua dos Girassóis, 789', 'Belo Horizonte', 'MG', 'Savassi', 34567890123456);
INSERT INTO Unidade VALUES (4, 'imagem4.jpg', '45678901', 'Rua das Acácias, 012', 'Curitiba', 'PR', 'Batel', 45678901234567);
INSERT INTO Unidade VALUES (5, 'imagem5.jpg', '56789012', 'Avenida das Rosas, 345', 'Porto Alegre', 'RS', 'Moinhos de Vento', 56789012345678);
INSERT INTO Unidade VALUES (6, 'imagem6.jpg', '67890123', 'Rua dos Lírios, 678', 'Salvador', 'BA', 'Barra', 67890123456789);
INSERT INTO Unidade VALUES (7, 'imagem7.jpg', '78901234', 'Avenida dos Cravos, 901', 'Fortaleza', 'CE', 'Meireles', 78901234567890);
INSERT INTO Unidade VALUES (8, 'imagem8.jpg', '89012345', 'Rua das Orquídeas, 234', 'Recife', 'PE', 'Boa Viagem', 89012345678901);
INSERT INTO Unidade VALUES (9, 'imagem9.jpg', '90123456', 'Avenida das Violetas, 567', 'Manaus', 'AM', 'Adrianópolis', 90123456789012);
INSERT INTO Unidade VALUES (10, 'imagem10.jpg', '01234567', 'Rua dos Jasmins, 890', 'Florianópolis', 'SC', 'Centro', 01234567890123);

-- Populando a tabela Avaliacao
INSERT INTO Avaliacao VALUES (1, 5, '01/05/2023', 12345678901234, 1);
INSERT INTO Avaliacao VALUES (2, 4, '02/05/23', 12345678901234, 2);
INSERT INTO Avaliacao VALUES (3, 3, '03/05/23', 23456789012345, 3);
INSERT INTO Avaliacao VALUES (4, 5, '04/05/23', 23456789012345, 4);
INSERT INTO Avaliacao VALUES (5, 2, '05/05/23', 34567890123456, 5);
INSERT INTO Avaliacao VALUES (6, 4, '06/05/23', 34567890123456, 6);
INSERT INTO Avaliacao VALUES (7, 5, '07/05/23', 45678901234567, 7);
INSERT INTO Avaliacao VALUES (8, 4, '08/05/23', 45678901234567, 8);
INSERT INTO Avaliacao VALUES (9, 3, '09/05/23', 56789012345678, 9);
INSERT INTO Avaliacao VALUES (10, 2, '10/05/23', 56789012345678, 10);

-- Populando a tabela Comentario_Restaurante
INSERT INTO Comentario_Restaurante VALUES (1, 'Ótimo restaurante!', '01/05/23', 1, 12345678901234);
INSERT INTO Comentario_Restaurante VALUES (2, 'Comida deliciosa!', '02/05/23', 2, 12345678901234);
INSERT INTO Comentario_Restaurante VALUES (3, 'Atendimento excelente!', '03/05/23', 3, 23456789012345);
INSERT INTO Comentario_Restaurante VALUES (4, 'Ambiente agradável.', '04/05/23', 4, 23456789012345);
INSERT INTO Comentario_Restaurante VALUES (5, 'Recomendo a todos!', '05/05/23', 5, 34567890123456);
INSERT INTO Comentario_Restaurante VALUES (6, 'Preços justos.', '06/05/23', 6, 34567890123456);
INSERT INTO Comentario_Restaurante VALUES (7, 'Voltarei com certeza!', '07/05/23', 7, 45678901234567);
INSERT INTO Comentario_Restaurante VALUES (8, 'Menu diversificado.', '08/05/23', 8, 45678901234567);
INSERT INTO Comentario_Restaurante VALUES (9, 'Comida saudável e saborosa.', '09/05/23', 9, 56789012345678);
INSERT INTO Comentario_Restaurante VALUES (10, 'Ótimo lugar para eventos.', '10/05/23', 10, 56789012345678);

-- Populando a tabela Artigo
INSERT INTO Artigo VALUES (1, 'O Futuro das Tecnologias Inovadoras', 'Este artigo explora como as tecnologias inovadoras estão moldando nosso futuro. Com o advento de avanços em inteligência artificial (IA), Internet das Coisas (IoT), realidade virtual e aumentada, e blockchain, estamos vendo um mundo mais conectado e automatizado. A evolução tecnológica tem influenciado todos os aspectos da vida humana, desde a maneira como nos comunicamos até a maneira como trabalhamos, aprendemos e nos divertimos.

A inteligência artificial tem revolucionado vários setores, incluindo saúde, educação, transporte, e finanças. Com o poder de aprender e melhorar com a experiência, a IA está ajudando a tornar os sistemas mais eficientes e eficazes. Da detecção de doenças à personalização do aprendizado, a IA está se tornando uma parte integral de nossas vidas.

A Internet das Coisas, por outro lado, está transformando objetos cotidianos em dispositivos inteligentes e conectados. Desde lâmpadas inteligentes até carros autônomos, a IoT está promovendo a eficiência e a conveniência. A capacidade de coletar e analisar dados em tempo real está levando a melhorias significativas na qualidade de vida e na tomada de decisões.

A realidade virtual e aumentada está criando experiências imersivas e transformando a maneira como interagimos com o mundo digital. Seja em jogos, treinamento ou design, essas tecnologias estão abrindo novos caminhos para a inovação.

O blockchain está oferecendo um novo nível de segurança e transparência para transações digitais. Ao descentralizar a verificação de transações, o blockchain tem o potencial de revolucionar setores como finanças, cadeias de suprimentos e governo.

No entanto, enquanto nos maravilhamos com essas realizações, também devemos estar cientes dos desafios éticos, legais e sociais que acompanham essa revolução tecnológica. Questões de privacidade, equidade, e regulamentação são cada vez mais importantes à medida que avançamos para um futuro mais digital.

Este artigo busca discutir as tendências atuais em tecnologias inovadoras, explorando suas aplicações, benefícios, desafios e possíveis direções futuras. Conforme nos preparamos para um futuro incerto, é crucial que adotemos uma abordagem ponderada e inclusiva para a inovação tecnológica. A tecnologia tem o potencial de transformar nosso mundo para melhor, mas somente se for usada com responsabilidade e consideração por seu impacto em todas as pessoas.', 'img_innovative_tech.jpg', '28/05/23', 1);


INSERT INTO Artigo VALUES (2, 'A importância da Agricultura Sustentável', 'A agricultura sustentável é uma abordagem de produção de alimentos que tem como objetivo ser ambientalmente saudável, economicamente rentável e socialmente responsável. Trata-se de um método de produção que conserva a água, reduz o uso de fertilizantes e pesticidas, e promove a biodiversidade nos campos.

A agricultura sustentável pode tomar várias formas, desde pequenas hortas urbanas até grandes fazendas comerciais. Algumas práticas comuns de agricultura sustentável incluem rotação de culturas, compostagem, cultivo consorciado, controle biológico de pragas, e manejo integrado de nutrientes.

A rotação de culturas ajuda a manter a saúde do solo e a reduzir a incidência de pragas e doenças. Alternar diferentes tipos de culturas ajuda a evitar a depleção de nutrientes específicos do solo e pode ajudar a quebrar os ciclos de pragas e doenças.

A compostagem é outra prática fundamental na agricultura sustentável. Ao converter resíduos orgânicos em um rico adubo, a compostagem ajuda a melhorar a fertilidade do solo e a reter umidade, o que pode ser especialmente útil em áreas propensas à seca.

O cultivo consorciado envolve o plantio de diferentes culturas próximas umas das outras, de maneira que elas possam se beneficiar mutuamente. Por exemplo, uma planta pode ajudar a repelir pragas que afetam a outra, ou uma planta pode ajudar a fixar nitrogênio no solo, beneficiando culturas que necessitam de muito nitrogênio.

O controle biológico de pragas envolve o uso de organismos naturais, como insetos predadores ou patógenos, para controlar pragas. Esta abordagem pode reduzir a necessidade de pesticidas químicos, que podem ter efeitos nocivos sobre o meio ambiente e a saúde humana.

O manejo integrado de nutrientes procura otimizar o uso de recursos e minimizar a poluição por nutrientes, equilibrando a necessidade de nutrientes das plantas com as entradas de nutrientes.

A agricultura sustentável não é apenas sobre práticas de cultivo, no entanto. Ela também inclui aspectos sociais e econômicos, como garantir condições de trabalho justas para os trabalhadores agrícolas, apoiar comunidades rurais, e promover a viabilidade econômica das fazendas.

A transição para uma agricultura mais sustentável é uma tarefa complexa que requer o envolvimento de muitos atores diferentes, incluindo agricultores, consumidores, pesquisadores, e políticos. No entanto, a longo prazo, a agricultura sustentável tem o potencial de proporcionar benefícios significativos, desde a proteção do meio ambiente até a promoção da segurança alimentar e a melhoria da qualidade de vida das comunidades rurais.', 'img_sustainable_agriculture.jpg', '28/05/23', 2);


INSERT INTO Artigo VALUES (3, 'Estratégias Eficientes para o Combate à Fome Mundial', 'O combate à fome mundial é uma das questões mais urgentes da nossa era. Apesar do progresso significativo nas últimas décadas, ainda há milhões de pessoas em todo o mundo que sofrem de desnutrição e insegurança alimentar. 

A fome é causada por uma série de fatores inter-relacionados, incluindo a pobreza, os conflitos, a instabilidade política, as mudanças climáticas e a falta de infraestrutura adequada para a produção e distribuição de alimentos. Portanto, combater a fome requer uma abordagem multifacetada que aborda todas essas questões.

Uma estratégia crucial para combater a fome é melhorar a produtividade agrícola. Isso pode ser feito através do desenvolvimento e difusão de tecnologias agrícolas melhoradas, como sementes de alto rendimento e técnicas de irrigação eficientes. Além disso, os agricultores precisam de acesso a crédito e a mercados para vender seus produtos, o que pode ser facilitado por políticas governamentais adequadas e pela construção de infraestruturas de transporte e armazenamento.

Outra estratégia importante é aumentar a resiliência das comunidades rurais às mudanças climáticas e outras formas de choque. Isso pode envolver a promoção de práticas agrícolas sustentáveis que conservam os recursos naturais e protegem a biodiversidade, bem como a construção de sistemas de proteção social que possam fornecer apoio em tempos de crise.

A promoção da igualdade de gênero na agricultura é outra medida fundamental. As mulheres desempenham um papel crucial na produção de alimentos em muitas partes do mundo, e garantir que elas tenham acesso a recursos, treinamento e oportunidades iguais pode ter um impacto significativo no combate à fome.

Por último, mas não menos importante, é essencial promover a paz e a estabilidade política, pois os conflitos e a instabilidade podem levar a crises de fome. Isso envolve a mediação de disputas, a promoção da democracia e dos direitos humanos, e a prevenção de conflitos através da diplomacia e da construção da paz.

O combate à fome é uma tarefa complexa que requer a colaboração de todos os segmentos da sociedade, desde governos e organizações internacionais até empresas e indivíduos. Cada um de nós pode contribuir para esta causa de várias maneiras, seja através da doação para organizações de ajuda alimentar, da defesa de políticas justas, ou simplesmente da conscientização sobre a questão.', 'img_world_hunger.jpg', '28/05/23', 3);


INSERT INTO Artigo VALUES (4, 'Desafiando a Escassez de Alimentos no Mundo Moderno', 'A escassez de alimentos é uma crise crescente que ameaça muitas comunidades ao redor do mundo. Devido a fatores como crescimento populacional, mudanças climáticas, instabilidade política e desigualdade econômica, muitas pessoas enfrentam dificuldades para acessar alimentos nutritivos e acessíveis.

A mudança climática é uma das principais causas da escassez de alimentos. Inundações, secas, tempestades e mudanças nas condições climáticas podem destruir colheitas e rebanhos, tornando difícil para os agricultores manter a produção de alimentos. Isso é especialmente problemático para os pequenos agricultores dos países em desenvolvimento, que muitas vezes carecem dos recursos para se adaptar a essas mudanças.

O crescimento populacional é outro fator que contribui para a escassez de alimentos. À medida que a população mundial continua a crescer, a demanda por alimentos aumenta. No entanto, o fornecimento de alimentos pode não conseguir acompanhar essa demanda, especialmente se as técnicas agrícolas atuais não se tornarem mais eficientes e sustentáveis.

A instabilidade política e a desigualdade econômica também podem levar à escassez de alimentos. Em regiões afetadas por conflitos, a produção e a distribuição de alimentos podem ser interrompidas, levando à fome. Além disso, a pobreza pode impedir que as pessoas acessem alimentos nutritivos, mesmo quando eles estão disponíveis.

Para enfrentar a escassez de alimentos, é necessário um esforço coordenado que envolva a implementação de estratégias de mitigação de longo prazo e ação imediata para fornecer assistência alimentar às pessoas afetadas. As estratégias de longo prazo podem incluir a promoção da agricultura sustentável, a melhoria da infraestrutura agrícola e de transporte, e a implementação de políticas para promover a segurança alimentar.

A pesquisa e a inovação tecnológica também desempenham um papel crucial na luta contra a escassez de alimentos. Novas tecnologias, como a agricultura de precisão e a edição de genes, podem ajudar a aumentar a produtividade agrícola e a resistência das plantas às mudanças climáticas.

Além disso, é crucial garantir que a ajuda alimentar chegue àqueles que mais precisam dela. Isso envolve o trabalho de organizações humanitárias e governos para distribuir alimentos em áreas de crise, bem como políticas que promovam a igualdade econômica e o acesso a alimentos nutritivos.

Em conclusão, a escassez de alimentos é um desafio complexo que exige uma abordagem multifacetada. Ao enfrentar as causas subjacentes e trabalhar para aumentar o acesso a alimentos nutritivos, podemos ajudar a aliviar a fome e a promover a segurança alimentar em todo o mundo.', 'img_food_scarcity.jpg', '28/05/23', 4);


INSERT INTO Artigo VALUES (5, 'Explorando as Possibilidades da IA Generativa', 'A Inteligência Artificial (IA) tem se mostrado uma ferramenta incrivelmente poderosa em uma infinidade de aplicações, desde o reconhecimento de fala até a análise de dados. No entanto, uma das áreas mais promissoras e emocionantes da IA é a geração de conteúdo, ou IA generativa.

A IA generativa se refere a algoritmos que podem criar algo novo, seja um texto, uma imagem, uma peça musical ou até mesmo um design de produto. Esses algoritmos não apenas replicam ou classificam dados existentes, mas também geram novas criações a partir de um conjunto de regras ou parâmetros.

Um exemplo bem conhecido de IA generativa são as Redes Adversariais Generativas (GANs). As GANs consistem em dois componentes principais: um gerador que cria novas instâncias, e um discriminador que tenta diferenciar entre instâncias reais e criadas. O gerador aprende a melhorar suas criações com base no feedback do discriminador.

A IA generativa tem uma variedade de aplicações potenciais. No campo das artes, por exemplo, já foi usada para criar novas pinturas, músicas e histórias. Na indústria, pode ser usada para criar designs de produtos ou para desenvolver novas soluções para problemas complexos.

No entanto, a IA generativa também levanta questões importantes sobre autoria e ética. Quem é o autor de uma obra de arte criada por uma IA? Como garantir que a IA generativa seja usada de maneira responsável e não seja usada para criar conteúdo enganoso ou prejudicial?

Também há desafios técnicos a serem superados. A IA generativa ainda está em sua infância e muitas de suas criações são imperfeitas. Além disso, os algoritmos de IA generativa podem ser extremamente intensivos em termos de computação e requerer grandes quantidades de dados para treinamento.

Apesar desses desafios, a IA generativa tem um enorme potencial. À medida que a tecnologia avança, é provável que vejamos cada vez mais aplicações impressionantes dessa nova e emocionante área da IA.', 'img_generative_ai.jpg', '28/05/23', 5);


INSERT INTO Artigo VALUES (6, 'A Ascensão da Agricultura Vertical: Perspectivas Futuras', 'A agricultura vertical é uma prática inovadora que tem o potencial de transformar o modo como produzimos alimentos. Trata-se do cultivo de plantas em ambientes internos, em múltiplas camadas ou andares, em vez de em um único nível, como em um campo ou estufa tradicional.

A agricultura vertical oferece uma série de vantagens em relação à agricultura tradicional. Por um lado, é extremamente eficiente em termos de espaço. Em um ambiente vertical, é possível cultivar muito mais alimentos por metro quadrado do que em um campo ou estufa. Além disso, a agricultura vertical pode ser praticada em áreas urbanas, reduzindo a necessidade de transporte e permitindo que os alimentos sejam cultivados mais perto de onde são consumidos.

Outra vantagem da agricultura vertical é que ela permite um controle preciso do ambiente de crescimento. Isso significa que as plantas podem ser cultivadas sob condições ideais durante todo o ano, independentemente do clima externo. Isso não apenas aumenta a produtividade, mas também reduz a necessidade de pesticidas e outros químicos.

Além disso, a agricultura vertical é altamente eficiente em termos de recursos. Ela usa significativamente menos água do que a agricultura tradicional e pode reciclar os nutrientes usados no processo de crescimento. Isso a torna uma opção sustentável para a produção de alimentos.

No entanto, a agricultura vertical também enfrenta desafios. Por exemplo, o custo inicial de instalação de uma fazenda vertical pode ser alto, e a energia necessária para iluminação e controle de temperatura pode ser significativa. Além disso, ainda há questões a serem resolvidas sobre a melhor maneira de cultivar certos tipos de plantas em um ambiente vertical.

Apesar desses desafios, a agricultura vertical tem um grande potencial para o futuro. À medida que a população mundial continua a crescer e o espaço para a agricultura tradicional se torna cada vez mais escasso, a capacidade de produzir alimentos de maneira eficiente e sustentável em ambientes urbanos se tornará cada vez mais importante. A agricultura vertical, com suas muitas vantagens, está bem posicionada para desempenhar um papel importante nesse futuro.', 'img_vertical_farming.jpg', '28/05/23', 6);


INSERT INTO Artigo VALUES (7, 'Aquaponia: Uma Revolução na Agricultura Sustentável', 'A aquaponia é uma forma revolucionária de agricultura que combina a criação de peixes (aquicultura) com o cultivo de plantas em água (hidroponia) em um sistema integrado. Este método inovador de produção de alimentos tem o potencial de tornar a agricultura mais sustentável e eficiente.

Na aquaponia, os peixes e as plantas coexistem em um sistema simbiótico. Os peixes produzem resíduos que são convertidos por bactérias em nutrientes para as plantas. Em troca, as plantas purificam a água, que é então recirculada para o tanque de peixes. Este ciclo contínuo cria um sistema de produção de alimentos eficiente e autossustentável.

Existem várias vantagens na aquaponia. Em primeiro lugar, é um sistema extremamente eficiente em termos de água, pois a maior parte da água é reciclada. Isso é especialmente importante em regiões onde a água é escassa. Além disso, a aquaponia não requer o uso de fertilizantes químicos, tornando-a uma opção mais ecológica.

A aquaponia também é altamente produtiva. Devido à sua natureza simbiótica, é possível produzir uma grande quantidade de peixes e vegetais em um espaço relativamente pequeno. Além disso, como a aquaponia pode ser praticada em ambientes fechados, ela permite a produção de alimentos durante todo o ano, independentemente das condições climáticas.

Apesar desses benefícios, a aquaponia também apresenta desafios. A configuração de um sistema aquapônico pode ser complexa e requer um monitoramento cuidadoso para garantir o equilíbrio entre peixes e plantas. Além disso, a energia necessária para manter o sistema em funcionamento pode ser significativa.

No entanto, o potencial da aquaponia para transformar a agricultura é imenso. À medida que enfrentamos os desafios da mudança climática e do crescimento populacional, a aquaponia oferece uma forma de produzir alimentos de maneira sustentável e eficiente. Com pesquisa e desenvolvimento contínuos, a aquaponia pode desempenhar um papel importante na alimentação do mundo no futuro.', 'img_aquaponics.jpg', '28/05/23', 7);


INSERT INTO Artigo VALUES (8, 'Hidroponia: O Futuro da Agricultura Urbana', 'A hidroponia é uma forma inovadora de agricultura que envolve o cultivo de plantas sem solo. Em vez disso, as plantas são cultivadas em uma solução de água rica em nutrientes, permitindo-lhes absorver diretamente os nutrientes necessários para o crescimento. Esta abordagem tem várias vantagens e tem potencial para transformar a agricultura urbana.

A primeira vantagem da hidroponia é a eficiência do espaço. Como as plantas não precisam de espaço para crescer as raízes no solo, elas podem ser cultivadas muito mais densamente do que na agricultura tradicional. Isso torna a hidroponia uma opção ideal para áreas urbanas, onde o espaço é limitado.

Além disso, a hidroponia é incrivelmente eficiente em termos de água. Na agricultura tradicional, grande parte da água usada para irrigação é perdida para a evaporação ou é drenada para fora do solo. Na hidroponia, a água é recirculada, significando que muito menos água é necessária para cultivar as mesmas quantidades de alimentos.

A hidroponia também permite um controle preciso sobre as condições de crescimento. Os nutrientes, a temperatura e a luz podem ser ajustados para otimizar o crescimento das plantas. Isso pode resultar em maior produtividade e alimentos de melhor qualidade.

No entanto, a hidroponia também tem desafios. A configuração e a manutenção de um sistema hidropônico podem ser complexas e requerem conhecimento técnico. Além disso, a energia necessária para manter o sistema de iluminação e a bomba de água pode ser significativa.

Apesar desses desafios, a hidroponia tem um grande potencial para o futuro. À medida que a população urbana continua a crescer e o espaço para a agricultura tradicional se torna cada vez mais escasso, a capacidade de produzir alimentos de maneira eficiente em ambientes urbanos será cada vez mais importante. A hidroponia, com suas muitas vantagens, está bem posicionada para desempenhar um papel importante nesse futuro.', 'img_hydroponics.jpg', '23/05/23', 8);


INSERT INTO Artigo VALUES 
(9, 'Desafios e Soluções na Distribuição de Alimentos', 'A distribuição de alimentos é um elemento crucial da segurança alimentar, garantindo que os alimentos produzidos cheguem aos consumidores de maneira eficiente e segura. No entanto, a distribuição de alimentos enfrenta uma série de desafios, desde a infraestrutura inadequada até a perda e desperdício de alimentos. 

A infraestrutura de transporte inadequada é um grande obstáculo para a distribuição eficiente de alimentos. Em muitas partes do mundo, a falta de estradas, portos e armazenamento adequados dificulta a entrega de alimentos às pessoas que deles necessitam. Além disso, a falta de refrigeração ou instalações de armazenamento adequadas pode levar à deterioração dos alimentos, resultando em perdas significativas.

Outro desafio é a perda e o desperdício de alimentos. Estima-se que um terço de todos os alimentos produzidos para consumo humano sejam perdidos ou desperdiçados. Grande parte dessa perda ocorre na fase de distribuição, quando os alimentos são danificados durante o transporte ou se deterioram antes de serem vendidos.

Para enfrentar esses desafios, são necessárias soluções inovadoras. Uma abordagem é o desenvolvimento de infraestrutura de transporte e armazenamento melhorada. Isso pode incluir o investimento em estradas e portos, bem como em tecnologia de refrigeração e armazenamento.

Outra solução é a adoção de práticas que reduzam a perda e o desperdício de alimentos. Isso pode envolver o uso de embalagens apropriadas, o treinamento de manipuladores de alimentos e o incentivo aos consumidores a comprar alimentos de forma mais responsável.

Finalmente, é importante que a distribuição de alimentos seja justa e equitativa. Isso significa garantir que todos, independentemente de onde vivem ou de sua renda, tenham acesso a alimentos nutritivos e acessíveis. Para isso, podem ser necessárias políticas que promovam a equidade na distribuição de alimentos.', 'img_food_distribution.jpg', '28/05/23', 9);


INSERT INTO Artigo VALUES (10, 'Inovações e Melhorias na Distribuição de Alimentos', 'A distribuição de alimentos é uma peça-chave na garantia da segurança alimentar global. No entanto, muitos desafios persistem, desde a perda de alimentos durante o transporte até a inacessibilidade dos alimentos em áreas remotas. Felizmente, uma série de inovações e melhorias estão sendo implementadas para superar esses obstáculos.

Um exemplo dessas inovações é a digitalização da cadeia de suprimentos de alimentos. Plataformas online estão sendo desenvolvidas para conectar produtores diretamente com os consumidores, reduzindo a necessidade de intermediários e tornando a distribuição mais eficiente. Além disso, as tecnologias de rastreamento e rastreabilidade estão sendo usadas para monitorar a jornada dos alimentos da fazenda para o garfo, permitindo que problemas sejam identificados e resolvidos mais rapidamente.

Outra inovação importante é o desenvolvimento de tecnologias de armazenamento e transporte mais eficientes. Isso inclui avanços na refrigeração e preservação de alimentos, o que pode reduzir a quantidade de alimentos que são perdidos devido à deterioração. Além disso, estão sendo desenvolvidos novos métodos de embalagem que prolongam a vida útil dos alimentos e protegem-nos de danos durante o transporte.

Finalmente, estão sendo tomadas medidas para tornar a distribuição de alimentos mais equitativa. Isso inclui programas que visam a melhorar o acesso a alimentos em áreas rurais e remotas, bem como políticas que promovem a justiça na cadeia de suprimentos de alimentos.

Apesar dessas melhorias, ainda há muito trabalho a ser feito para garantir que todos tenham acesso a alimentos seguros, nutritivos e acessíveis. À medida que avançamos, será crucial continuar a inovar e a melhorar a maneira como distribuímos alimentos em todo o mundo.', 'img_improving_food_distribution.jpg', '28/05/23', 10);


-- Populando a tabela Comentario_Artigo
INSERT INTO Comentario_Artigo VALUES (1, 'Ótimo artigo!', '01/05/23', 1, 1);
INSERT INTO Comentario_Artigo VALUES (2, 'Gostei das dicas!', '02/05/23', 2, 2);
INSERT INTO Comentario_Artigo VALUES (3, 'Preciso visitar esses restaurantes!', '03/05/23', 3, 3);
INSERT INTO Comentario_Artigo VALUES (4, 'Nunca experimentei esses ingredientes.', '04/05/23', 4, 4);
INSERT INTO Comentario_Artigo VALUES (5, 'Adoro ficar por dentro das tendências!', '05/05/23', 5, 5);
INSERT INTO Comentario_Artigo VALUES (6, 'Informações muito úteis!', '06/05/23', 6, 6);
INSERT INTO Comentario_Artigo VALUES (7, 'Que interessante!', '07/05/23', 7, 7);
INSERT INTO Comentario_Artigo VALUES (8, 'Vou marcar esses eventos no calendário.', '08/05/23', 8, 8);
INSERT INTO Comentario_Artigo VALUES (9, 'Gosto de conhecer a história da culinária.', '09/05/23', 9, 9);
INSERT INTO Comentario_Artigo VALUES (10, 'As receitas regionais são deliciosas!', '10/05/23', 10, 10);

-- Populando a tabela Restaurante_PraticasSustentaveis
INSERT INTO Restaurante_PraticasSustentaveis VALUES (12345678901234, 1);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (12345678901234, 2);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (23456789012345, 3);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (23456789012345, 4);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (34567890123456, 5);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (34567890123456, 6);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (45678901234567, 7);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (45678901234567, 8);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (56789012345678, 9);
INSERT INTO Restaurante_PraticasSustentaveis VALUES (56789012345678, 10);

-- Populando a tabela Curte
INSERT INTO Curte VALUES (1, 1);
INSERT INTO Curte VALUES (1, 2);
INSERT INTO Curte VALUES (2, 3);
INSERT INTO Curte VALUES (2, 4);
INSERT INTO Curte VALUES (3, 5);
INSERT INTO Curte VALUES (3, 6);
INSERT INTO Curte VALUES (4, 7);
INSERT INTO Curte VALUES (4, 8);
INSERT INTO Curte VALUES (5, 9);
INSERT INTO Curte VALUES (5, 10);

COMMIT;


