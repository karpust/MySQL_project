INSERT INTO directions (`name`)
VALUES ('ИТ'),
       ('Программирование'),
       ('Машинное обучение'),
       ('Аналитика'),
       ('Тестирование'),
       ('ИТ-архитектура'),
       ('Blockchain'),
       ('Продукт и проекты'),
       ('Маркетинг'),
       ('Игры'),
       ('Дизайн'); -- 11


INSERT INTO `specializations`
VALUES (1, 'Программист'),
       (2, 'Тестировщик'),
       (3, 'Аналитик'),
       (4, 'Project-manager'),
       (5, 'Product-manager'),
       (6, 'Инженер-программист'),
       (7, 'Дизайнер'),
       (8, 'Интернет-маркетолог'); -- 8


INSERT INTO `programms`
VALUES (1, 'http://lorempixel.com/640/480/', 'Quae libero praesentium ut voluptas provident iusto quia.', 'middle+', 0,
        'Minima nostrum ut laboriosam veritatis deserunt recusandae. Quos aut et et laborum minima fugiat aliquam velit. Quibusdam id quibusdam quos fugiat accusamus et dolor. Et soluta non ipsam et vitae et aut nostrum.',
        70434, 'http://lorempixel.com/640/480/', '2023-08-16', 'cupiditate', 128936.00),
       (2, 'http://lorempixel.com/640/480/', 'Odit fugiat distinctio dolores fugiat ea maxime dicta facere.',
        'middle', 0,
        'Iste hic laborum sit dolores porro asperiores. Libero quae nesciunt dicta nesciunt non reiciendis debitis. Commodi dolorum et omnis ab qui omnis non. Non est magnam rerum.',
        78565, 'http://lorempixel.com/640/480/', '2021-12-06', 'maxime', 97595.00),
       (3, 'http://lorempixel.com/640/480/', 'Ad adipisci quia non laboriosam aut est.', 'junior', 1,
        'Est fugiat consequuntur voluptas rem odio autem fuga. Atque commodi quas voluptas qui consequatur. Deleniti perspiciatis a harum. Est quae quisquam reiciendis.',
        78672, 'http://lorempixel.com/640/480/', '2023-06-08', 'perspiciatis', 98864.00),
       (4, 'http://lorempixel.com/640/480/', 'Vitae exercitationem maxime in earum est fuga.', 'junior', 1,
        'Optio nulla aut ipsum autem optio. Deleniti quia est voluptas. Aliquam perferendis eum ea rerum consequatur temporibus. Dolore asperiores nihil aut illo adipisci repellendus eos.',
        75026, 'http://lorempixel.com/640/480/', '2022-01-22', 'voluptatem', 92458.00),
       (5, 'http://lorempixel.com/640/480/', 'Repellendus dolor occaecati facere eum nesciunt.', 'junior', 1,
        'Repellat ut delectus ratione nam sequi iure qui non. Iure aut minus reiciendis iste qui. Quidem vel adipisci voluptatem consequatur nostrum. Quis excepturi mollitia porro qui tempora porro possimus. Libero facilis soluta est deleniti nesciunt.',
        73890, 'http://lorempixel.com/640/480/', '2023-08-15', 'voluptatem', 103443.00),
       (6, 'http://lorempixel.com/640/480/', 'Ut nemo debitis enim dolor consequuntur.', 'Intern', 0,
        'In dolores excepturi deleniti molestiae iusto veniam. Corrupti non nisi libero ratione animi. Iusto et omnis quia nobis. Voluptates tempora qui qui ut ea voluptas ab.',
        77076, 'http://lorempixel.com/640/480/', '2021-11-14', 'numquam', 121296.00),
       (7, 'http://lorempixel.com/640/480/', 'Laboriosam omnis qui rerum.', 'Intern', 1,
        'Et minus repudiandae ratione a autem provident. Omnis dolor numquam ut illum repellendus repudiandae. Aut reiciendis veritatis laborum quo. Aliquid tempora molestiae quia molestias sit.',
        72254, 'http://lorempixel.com/640/480/', '2021-09-08', 'voluptas', 119589.00),
       (8, 'http://lorempixel.com/640/480/', 'Fuga quia dolorum nisi non ut.', 'Intern', 1,
        'Iusto pariatur et minima quia. Et eaque facilis aut nemo. Dicta amet repellat est sequi.', 74814,
        'http://lorempixel.com/640/480/', '2020-12-08', 'architecto', 100061.00),
       (9, 'http://lorempixel.com/640/480/', 'Aut blanditiis aspernatur officiis fugiat.', 'middle', 0,
        'Dolore ullam voluptatem ut tempore cupiditate aut corporis. Sequi id dicta est rerum quo quae. Omnis dolores quia tenetur culpa quo. Quasi vel qui et ex.',
        78419, 'http://lorempixel.com/640/480/', '2022-01-30', 'illo', 103446.00),
       (10, 'http://lorempixel.com/640/480/', 'Et est labore praesentium aut impedit qui eaque.', 'middle+',
        0,
        'Numquam commodi suscipit qui facilis sit aperiam. Et rerum in fugiat officia quia doloribus. Corporis et molestiae fugit error impedit et.',
        75476, 'http://lorempixel.com/640/480/', '2021-03-10', 'alias', 123707.00); -- 10


INSERT INTO `specializations_programms`
VALUES (1, 1),
       (1, 5),
       (1, 9),
       (1, 8),
       (1, 10),
       (2, 2),
       (2, 6),
       (2, 10),
       (2, 7),
       (2, 9),
       (3, 3),
       (3, 7),
       (3, 10),
       (3, 5),
       (3, 9),
       (4, 4),
       (4, 8),
       (4, 2),
       (4, 6),
       (4, 1),
       (5, 1),
       (5, 5),
       (5, 9),
       (5, 10),
       (5, 7),
       (6, 2),
       (6, 6),
       (6, 10),
       (6, 4),
       (6, 8),
       (7, 3),
       (7, 7),
       (7, 1),
       (7, 5),
       (7, 9),
       (8, 4),
       (8, 8),
       (8, 2),
       (8, 6),
       (8, 10); -- 40


INSERT INTO `directions_programms`
VALUES (1, 1),
       (1, 3),
       (1, 5),
       (1, 2),
       (1, 4),
       (2, 2),
       (2, 4),
       (2, 6),
       (2, 3),
       (2, 5),
       (3, 3),
       (3, 5),
       (3, 7),
       (3, 4),
       (3, 6),
       (4, 4),
       (4, 6),
       (4, 8),
       (4, 9),
       (4, 7),
       (5, 5),
       (5, 7),
       (5, 9),
       (5, 6),
       (5, 8),
       (6, 6),
       (6, 8),
       (6, 1),
       (6, 7),
       (6, 9),
       (7, 7),
       (7, 9),
       (7, 8),
       (7, 2),
       (8, 1),
       (8, 8),
       (8, 10),
       (8, 9),
       (9, 2),
       (9, 9),
       (9, 1),
       (9, 10),
       (10, 1),
       (10, 3),
       (10, 10),
       (10, 2),
       (11, 2),
       (11, 4),
       (11, 1),
       (11, 3); -- 50


INSERT INTO `technologies`
VALUES (49, 'adipisci'),
       (45, 'alias'),
       (11, 'aliquam'),
       (39, 'architecto'),
       (14, 'atque'),
       (31, 'autem'),
       (47, 'consequatur'),
       (5, 'culpa'),
       (1, 'debitis'),
       (6, 'dolor'),
       (29, 'dolorem'),
       (48, 'ea'),
       (38, 'earum'),
       (19, 'eius'),
       (8, 'eligendi'),
       (26, 'enim'),
       (50, 'est'),
       (9, 'et'),
       (44, 'exercitationem'),
       (13, 'explicabo'),
       (17, 'labore'),
       (32, 'laborum'),
       (2, 'magni'),
       (36, 'minus'),
       (16, 'neque'),
       (20, 'nesciunt'),
       (42, 'nihil'),
       (41, 'nisi'),
       (24, 'nobis'),
       (21, 'non'),
       (15, 'nulla'),
       (28, 'omnis'),
       (10, 'quae'),
       (34, 'quasi'),
       (33, 'quia'),
       (46, 'quidem'),
       (37, 'quo'),
       (43, 'ratione'),
       (35, 'reiciendis'),
       (4, 'rerum'),
       (18, 'saepe'),
       (12, 'sed'),
       (27, 'sit'),
       (3, 'sunt'),
       (7, 'tenetur'),
       (30, 'totam'),
       (23, 'ullam'),
       (40, 'ut'),
       (25, 'vel'),
       (22, 'voluptatem'); -- 50


INSERT INTO `technologies_programms`
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 1),
       (12, 2),
       (13, 3),
       (14, 4),
       (15, 5),
       (16, 6),
       (17, 7),
       (18, 8),
       (19, 9),
       (20, 10),
       (21, 1),
       (22, 2),
       (23, 3),
       (24, 4),
       (25, 5),
       (26, 6),
       (27, 7),
       (28, 8),
       (29, 9),
       (30, 10),
       (31, 1),
       (32, 2),
       (33, 3),
       (34, 4),
       (35, 5),
       (36, 6),
       (37, 7),
       (38, 8),
       (39, 9),
       (40, 10),
       (41, 1),
       (42, 2),
       (43, 3),
       (44, 4),
       (45, 5),
       (46, 6),
       (47, 7),
       (48, 8),
       (49, 9),
       (50, 10); -- 50


INSERT INTO edu_groups (name, special_id, programm_id)
VALUES ('adipisci', 1, 1);
INSERT INTO edu_groups (name, special_id, programm_id)
VALUES ('suscipit', 4, 6);
INSERT INTO edu_groups (name, special_id, programm_id)
VALUES ('quis', 5, 5);
INSERT INTO edu_groups (name, special_id, programm_id)
VALUES ('temporibus', 2, 6);
INSERT INTO edu_groups (name, special_id, programm_id)
VALUES ('molestiae', 3, 5);


CALL students_fill_sp('Dante', 'Walter', 89044828097,
                      'oupton@example.net', 'male', 'Antigua and Barbuda',
                      'North Jenniebury', '1992-07-28', 'Similique quas provident nulla.',
                      'f4be7e46c4fe301894bfd74554717492904f2d17', 'http://lorempixel/640/480/',
                      1, 'Ut ut explicabo qui. Error quis distinctio a laboriosam esse quod.',
                      @trans_result);

CALL students_fill_sp('Kip', 'Barrows', 89877538566, 'augusta14@example.com',
                      'female', 'Lebanon', 'Orinfort', '1999-10-12',
                      'Modi vel omnis quo voluptatem deleniti.', '564ec48d00e14a2e94355099d8140cf62adc1c74',
                      'http://lorempixel.com/640/480/', 1,
                      'Aut at veritatis id consequuntur facere aut sed. Nesciunt laborum quia voluptas recusandae.
              Non consectetur et dolorem est blanditiis inventore. Cum occaecati repellat expedita dolores.',
                      @trans_result);

CALL students_fill_sp('Korbin', 'Jast', 89067819723, 'bethel.anderson@example.org',
                      'other', 'Saint Pierre and Miquelon',
                      'Daxburgh', '1988-02-04', 'Inventore ipsa repellat ea modi odio est illum.',
                      '8c31375c698c766be22a2bce82ef2d42b994c39a', 'http://lorempixel.com/640/480/', 3,
                      'In quo sint delectus provident culpa harum. Et id culpa asperiores dolor necessitatibus.
              Modi voluptas eaque sed enim et sit.', @trans_result);
CALL students_fill_sp('Micah', 'Kutch', 89448868417, 'ernesto00@example.com',
                      'female', 'Norway', 'Gerholdmouth', '1983-06-08',
                      'Eum laborum quo voluptatem sapiente quod sapiente occaecati.',
                      '7e550254a8f8c5be1c08544abd823f910cbc5806',
                      'http://lorempixel.com/640/480/', 4,
                      'Nostrum aspernatur molestiae autem. Corporis natus voluptatibus odit optio blanditiis qui
              animi. Nulla expedita et eligendi aut ex. Autem dicta sed fugit consequatur et.', @trans_result);
CALL students_fill_sp('Desmond', 'Koepp', 89654236772, 'sven59@example.com',
                      'female', 'Yemen', 'Skilesfort', '1977-05-05',
                      'Praesentium eius hic provident fuga ratione soluta fugiat aut.',
                      'de20002c54e2f81feabca4e923ac86ab02e9681d',
                      'http://lorempixel.com/640/480/', 5,
                      'Facilis est architecto quia veritatis. Magnam nemo sit ut ullam unde voluptatem excepturi.
              Aut et numquam quis quae. Sapiente ipsam odio tenetur sequi praesentium dolorem voluptas aut.',
                      @trans_result);
CALL students_fill_sp('Emmanuel', 'Olson', 89264766375, 'otis96@example.net',
                      'other', 'Turkey', 'Gerhardview', '2018-11-26',
                      'Culpa autem quo optio possimus earum expedita maxime.',
                      'b66ab36c43f09a044341c2d227d771c4c1b64593',
                      'http://lorempixel.com/640/480/', 1,
                      'A repudiandae repudiandae minima nihil consequuntur. Facere ipsam aut modi deserunt quibusdam.
              Est blanditiis aut non iste et reiciendis.',
                      @trans_result);
CALL students_fill_sp('Jonatan', 'Balistreri', 89328074303,
                      'kassulke.jimmie@example.com', 'male', 'Haiti', 'North Caterina',
                      '2021-01-19', 'Dolores autem incidunt aut inventore expedita amet magnam.',
                      '0eb1483788d9e63418200be319225ef1f7478c79', 'http://lorempixel.com/640/480/', 2,
                      'Asperiores iusto sit soluta dicta fuga nihil exercitationem. Excepturi alias tempore voluptas
              eum architecto voluptates suscipit. Omnis ut repellendus eos ut repudiandae.',
                      @trans_result);
CALL students_fill_sp('Dawn', 'Cormier', 89786034378, 'dameon.bradtke@example.org',
                      'other', 'Latvia', 'Lake Brendenview',
                      '2022-04-24', 'Quasi eum cupiditate unde ab consectetur.',
                      '04e63c3e61843787bc106dd472094833074a2aa8',
                      'http://lorempixel.com/640/480/', 4,
                      'Et sint et omnis blanditiis hic autem. Consequatur nihil minima voluptate accusamus libero.
              Modi et molestiae dolores doloribus. Dolor quo omnis consectetur deleniti voluptatem.', @trans_result);
CALL students_fill_sp('Ubaldo', 'Moen', 89270077158, 'ccormier@example.com',
                      'male', 'Romania', 'Shieldsland', '1996-05-14',
                      'Nihil provident in sunt quaerat quidem qui dolores.',
                      '267a98609239680a817cece632a45399d9b6d734',
                      'http://lorempixel.com/640/480/', 4,
                      'Maxime occaecati quasi a accusamus ut qui illum. Et facilis accusantium nemo sed hic unde.
              Error quia ea non asperiores fugiat officia rerum. Voluptatem numquam rerum voluptatem ut eum.',
                      @trans_result);
CALL students_fill_sp('Jerad', 'Padberg', 89517435921, 'fabiola60@example.com',
                      'male', 'Saint Lucia', 'Raynorbury', '2018-03-06',
                      'Ea quos quisquam maiores cupiditate harum dolores perspiciatis.',
                      'bb26ef76f31b7514cf4fa7e8ab9b48c08dcd4caf',
                      'http://lorempixel.com/640/480/', 4,
                      'Non sit aut odit aspernatur omnis ad. Expedita qui consequatur optio perspiciatis. Dolores
              quasi sit earum et hic dolore cumque maiores. Architecto maiores sapiente natus.', @trans_result);
CALL students_fill_sp('Turner', 'McCullough', 89786393973, 'grant.trudie@example.com',
                      'other', 'Macedonia', 'Lake Kaileeton',
                      '1996-03-19', 'Earum nisi ea quidem at nulla voluptate ratione.',
                      '722ba2719b91b16bc12f874f1ae8bfeb3b1110d9',
                      'http://lorempixel.com/640/480/', 1, 'Aut rerum modi ipsa placeat beatae quidem
vel non. Quibusdam nostrum et nobis quia.', @trans_result);
CALL students_fill_sp('Cleora', 'Abernathy', 89109381386, 'faye33@example.com',
                      'male', 'Holy See (Vatican City State)',
                      'Karolannstad', '1987-04-28', 'Qui fugiat aut aspernatur.',
                      '433a270db6e8ec7b97f87e9a5334beb7ddc726ba',
                      'http://lorempixel.com/640/480/', 2,
                      'Enim perferendis nisi corporis aliquam nostrum velit. Labore laborum ut quo doloribus sit sed
              sed. Quasi eum officiis et qui quisquam.', @trans_result);
CALL students_fill_sp('Hilda', 'Collins', 89703926446, 'emile23@example.org',
                      'male', 'Cuba', 'Dakotaville', '1997-03-06',
                      'Unde neque et expedita.', '047263c09ca3bc325508413fee3316cbae3ba9e2',
                      'http://lorempixel.com/640/480/', 3,
                      'Dolores et totam molestiae quod est quae laboriosam. Non consequatur aut sit repellendus ad
              omnis quis. Sunt et rem minus amet quia perferendis qui.',
                      @trans_result);
CALL students_fill_sp('Leopold', 'Nitzsche', 89705616591,
                      'mcdermott.deontae@example.com', 'female', 'Guernsey', 'Zoefurt',
                      '2005-05-18', 'Perferendis temporibus qui qui.',
                      'c6d2a959b34eac1787bbce02fe8fa896d9cfd186',
                      'http://lorempixel.com/640/480/', 4,
                      'Voluptatem saepe dolorem dolores molestiae ratione. Corrupti et delectus impedit reiciendis.
              Recusandae voluptatum quasi ipsa eaque ut.', @trans_result);
CALL students_fill_sp('Celestine', 'Schmeler', 89584688149,
                      'bayer.bridget@example.net', 'female', 'Guyana', 'Lake Jayceeberg',
                      '2018-10-30', 'Ut quaerat quidem itaque alias aperiam sit sunt.',
                      '238a92dd1349199c7e8362a4278d66570475254e',
                      'http://lorempixel.com/640/480/', 3,
                      'Cum culpa repudiandae temporibus odio suscipit veritatis quia laudantium. Necessitatibus rerum
              assumenda accusamus. Sed et fuga quae ut ullam nihil commodi.', @trans_result);
CALL students_fill_sp('Dario', 'White', 89245758464, 'tremblay.isom@example.net',
                      'female', 'Fiji', 'Moenside', '2015-08-06',
                      'Est dolores ut suscipit aperiam voluptas cum harum.',
                      '10528917344b903a5d0a542e895d988d227455e1',
                      'http://lorempixel.com/640/480/', 1,
                      'Nam aut dignissimos sunt exercitationem magni nisi. Est dolor ut et ut sint necessitatibus qui.
              Commodi a qui et sequi delectus consequatur quidem.', @trans_result);
CALL students_fill_sp('Lafayette', 'Stehr', 89981051455, 'cweissnat@example.net',
                      'other', 'United States of America',
                      'Sauerborough', '2006-09-29', 'Quo totam voluptatibus expedita dolores quis
exercitationem debitis.',
                      'cbdd1aef95d4c225ffacac6e58d3c95cf914c789', 'http://lorempixel.com/640/480/', 2,
                      'Quia reiciendis et culpa quis doloribus assumenda fugit dolorem. Non deleniti expedita hic dolorum
              doloremque. Non placeat nulla cumque sapiente et nemo.',
                      @trans_result);
CALL students_fill_sp('Kade', 'Little', 89788894439, 'gillian49@example.com',
                      'male', 'Saudi Arabia', 'South Rosemarie',
                      '1981-09-09', 'Veniam dolorem voluptas nesciunt.',
                      'bc5982ba7a136c2906dccd1ace3a6db04713cb13',
                      'http://lorempixel.com/640/480/', 3,
                      'Est fuga deserunt laudantium reiciendis voluptatem voluptas. Fugit non qui ex quam fuga repellendus
              sequi. Molestiae atque adipisci porro. Quis nemo non est omnis sed.', @trans_result);
CALL students_fill_sp('Maverick', 'Gerhold', 89170391942,
                      'marion.kertzmann@example.org', 'female', 'Ghana', 'North Eveline',
                      '1987-09-22', 'Autem et at harum et est sit.',
                      'aae64ab2623f40b80ad4f402fe765a7aee9f1113',
                      'http://lorempixel.com/640/480/', 4,
                      'Omnis voluptatem laboriosam eos reiciendis. Veniam id aut ipsam et. Aut optio molestiae amet alias.
              Id ad quis consequatur debitis officia sit inventore autem.', @trans_result);
CALL students_fill_sp('Sabryna', 'Altenwerth', 89872676964,
                      'carlie.bergnaum@example.net', 'female', 'Saint Helena',
                      'Clarissafurt', '1997-03-22', 'Et accusantium optio laboriosam voluptatem ab.',
                      '3ea768a15c000c918e7962920390d6f812804256', 'http://lorempixel.com/640/480/', 5,
                      'Placeat corporis molestiae dolorem vel qui accusantium nulla. Quia assumenda consequatur quaerat aut
              sed ad amet quae. Ex qui aut incidunt recusandae deleniti voluptatibus.', @trans_result);
CALL students_fill_sp('Talia', 'Harris', 89112781585, 'ksanford@example.net',
                      'other', 'Switzerland', 'North Samirstad',
                      '2002-10-28', 'Veniam et fugit minus libero sint debitis eius.',
                      'ce4263a6061706cc3cad6d860a149e99d156521d',
                      'http://lorempixel.com/640/480/', 1,
                      'Soluta sed consequatur assumenda consequatur est. Repudiandae iure quia asperiores dicta non sit
              suscipit eligendi. Quia omnis aperiam fugiat iste animi quis.', @trans_result);
CALL students_fill_sp('Boyd', 'Runolfsdottir', 89391400227,
                      'buddy.armstrong@example.net', 'female', 'Jordan', 'North Claudton',
                      '1993-08-28', 'Ipsa eos voluptatem cumque perspiciatis.',
                      '19bc2af04b5eb15b2f345d5ac452361055b23abc',
                      'http://lorempixel.com/640/480/', 2,
                      'Architecto ea voluptatibus ut possimus nam. Et quia voluptatibus quod ullam perspiciatis. Voluptatem
              quidem beatae architecto.', @trans_result);
CALL students_fill_sp('Cletus', 'Orn', 89767298174, 'golden90@example.org',
                      'male', 'Gambia', 'North Muriel', '2008-04-07',
                      'Tempore voluptatem ipsam in vitae nam eos.', '1f2e442219de370147760524473356c8b9c9beb1',
                      'http://lorempixel.com/640/480/', 3,
                      'Dolorem doloribus qui corporis recusandae officia est. Qui et voluptate excepturi quidem qui quo
              enim. Nostrum non tempore aut quos neque.', @trans_result);
CALL students_fill_sp('Barry', 'Koepp', 89286666927, 'mraz.jammie@example.net',
                      'other', 'Burundi', 'Schuppefort', '2009-06-08',
                      'Ut et quae doloribus ut ut pariatur enim.', 'e71fdac89a82497219ee95b9f84ed30436f898ed',
                      'http://lorempixel.com/640/480/', 4,
                      'Quis quaerat aperiam distinctio ut tempore nobis. Dolor ipsam omnis id et. Aliquam ut atque
              perspiciatis quae.', @trans_result);
CALL students_fill_sp('Eve', 'Hammes', 89606476842, 'jhand@example.org',
                      'female', 'Eritrea', 'Port Adah', '1990-01-08',
                      'Sint molestiae repellendus pariatur facere.', '2595556425a4b92e9ea17758dfa625a8301e9b84',
                      'http://lorempixel.com/640/480/', 5,
                      'Molestiae eligendi dolor qui corrupti amet fugit. Non sint ipsum iure similique atque tenetur
              consequatur.', @trans_result);
CALL students_fill_sp('Domenic', 'Pfeffer', 89252886408, 'ekuhic@example.org',
                      'other', 'Benin', 'Vitoside', '1990-11-04',
                      'Autem maiores quia nobis consequatur.', 'e235f98d07766f9a86fc74d8bc45ceb1432da942',
                      'http://lorempixel.com/640/480/', 1,
                      'Provident id explicabo voluptate et dignissimos repellat suscipit. Laboriosam sed quidem quos
              dignissimos dolores. Autem odio nobis possimus aspernatur molestiae et.',
                      @trans_result);
CALL students_fill_sp('Stephany', 'Jast', 89119333256, 'garrick06@example.net',
                      'other', 'Sweden', 'Davidville', '2002-10-29',
                      'Sunt minus alias nisi.', '685abe7220e1745310f57815f4d81c0efac7a238',
                      'http://lorempixel.com/640/480/', 2,
                      'Rerum ipsum tempora aut non magni delectus consequuntur libero. Nihil quo eligendi sed maiores.
              Quae sequi veniam ea autem aut.', @trans_result);
CALL students_fill_sp('Reginald', 'Hermann', 89152422990,
                      'mathilde.cronin@example.com', 'female', 'Vietnam', 'Klockomouth',
                      '1985-09-26', 'Alias sunt sit eos doloremque numquam.',
                      'b58e0a4dc3ce931bfa1d6b9a9a0c9b5b4ba5d459',
                      'http://lorempixel.com/640/480/', 3,
                      'Repellat rerum recusandae itaque autem. Enim odit sed itaque non repudiandae. Explicabo expedita
              quia aut officia similique qui repudiandae.', @trans_result);
CALL students_fill_sp('Constance', 'Zboncak', 89663145225, 'nfeeney@example.net',
                      'other', 'Reunion', 'Port Theo', '1973-04-21',
                      'Enim facilis earum corporis quia nemo alias voluptatem.',
                      'b39a53e2bf9ce014f5bbb36d5ea4e7c53794edc5',
                      'http://lorempixel.com/640/480/', 4,
                      'Vel aut fuga quas aspernatur consequatur. Voluptates saepe quibusdam ut. Dolores repellat tenetur
              omnis minus aut voluptatibus voluptas.', @trans_result);
CALL students_fill_sp('Meta', 'Dibbert', 89900906863, 'dennis.senger@example.net',
                      'other', 'Korea', 'Port Lesly', '1983-03-12',
                      'Deserunt ea qui consequatur.', '9f1fd4d581cda8abfbb684166f17a4f2f6287493',
                      'http://lorempixel.com/640/480/', 5,
                      'Voluptas similique adipisci vel non voluptatem enim. Nisi non et consequuntur quis nihil voluptatem.
              Mollitia tenetur nam molestiae ab saepe. Repellat ipsa voluptatum eius eos.', @trans_result);
CALL students_fill_sp('Penelope', 'Parisian', 89291870242, 'xhayes@example.net',
                      'male', 'Cyprus', 'West Darronville',
                      '2009-06-16', 'Non repudiandae odit non ad animi exercitationem.',
                      '4508f62d9ec11b2b4c5ec9548c530e1870d39010',
                      'http://lorempixel.com/640/480/', 1,
                      'Vel at odio qui non temporibus et dolores. Iusto eos qui nesciunt omnis fugiat molestiae. Excepturi
              eveniet quo sapiente accusantium ea. Vitae ipsa enim molestiae molestiae.', @trans_result);
CALL students_fill_sp('Catherine', 'Marquardt', 89509213516, 'mauricio77@example.com',
                      'other', 'Portugal', 'Lake Alejandrin',
                      '1975-10-18', 'Iusto tenetur nemo occaecati odio.',
                      'd1227173be33bb5f6cd5c50c0df682beef82e026',
                      'http://lorempixel.com/640/480/', 2,
                      'Qui voluptates est non illo repellendus placeat dolorum voluptatibus. Ut voluptatibus inventore sit.
              Delectus quisquam accusamus et eos. Architecto consequatur .', @trans_result);
CALL students_fill_sp('Adell', 'Luettgen', 89817016705, 'schaden.darwin@example.com',
                      'female', 'Togo', 'Vonberg', '1995-01-24',
                      'Voluptas eos nobis aut rerum.', 'dd0116c587fca255dfbc66e9306b17f3915572a4',
                      'http://lorempixel.com/640/480/', 3,
                      'Eos minima voluptas totam voluptates aut omnis blanditiis. Quam facilis non ut quo. Temporibus placeat
              dolore officiis nostrum magnam consequuntur quaerat',
                      @trans_result);
CALL students_fill_sp('Jedidiah', 'Hilll', 89037108092, 'hoeger.raven@example.com',
                      'female', 'Belarus', 'West Elise',
                      '1996-04-13', 'Sed ut deleniti ut minus aut.',
                      '8e7e9e1de3e359e2ea2da1fae6d6f214f2a69506',
                      'http://lorempixel.com/640/480/', 4,
                      'Perspiciatis nemo reprehenderit reiciendis doloremque. Harum aliquam provident quam aut consequatur.
              Qui eligendi itaque omnis illo numquam. Minus adipisci qui.', @trans_result);
CALL students_fill_sp('Marie', 'Fahey', 89804449928, 'hermann.gretchen@example.com',
                      'female', 'Russian Federation', 'Port Piper',
                      '1982-04-26', 'Sapiente et numquam repudiandae.',
                      '97aa4226ec121ffb9c77cb41b4bdac6aa2e4d3fd',
                      'http://lorempixel.com/640/480/', 5,
                      'Laboriosam aperiam repellendus enim aut animi. Fugit hic dicta dolores occaecati. Voluptatem
              explicabo deserunt sed laboriosam totam vero quo incidunt. ',
                      @trans_result);



CALL teachers_fill_sp('Bettye', 'Davis', 89650151584, 'imogene82@example.net', 'male', 'Morocco', 'South Caitlynton',
                      '1999-01-03', 'Nemo soluta dolor eum quis culpa autem.',
                      '4933f687daf00db32ddd83eb10cc3e486077e1ed',
                      'http://lorempixel.com/640/480/',
                      'Vitae autem nulla eius libero ut aperiam. Fugit quia similique reprehenderit est veniam. Animi ipsam eum aut asperiores eveniet aut sint. Odit et ex vero harum accusantium doloremque est aut.',
                      'Quibusdam odit quos reiciendis ut qui et doloribus ut.',
                      'Iure voluptatibus ab deserunt quam aut eum.',
                      'Asperiores repudiandae perspiciatis rem consequatur quia nesciunt laudantium molestias.',
                      'Aliquam adipisci ea totam nisi impedit debitis voluptatum quod.',
                      'Voluptate rerum natus et possimus sit deleniti. Excepturi in cumque deserunt animi architecto voluptas. Consequuntur esse eum sequi saepe ex aut.',
                      'Alias porro et molestiae.', @trans_result);
CALL teachers_fill_sp('Ashleigh', 'Prosacco', 89551628163, 'rmckenzie@example.org', 'female', 'Vietnam', 'South Luisa',
                      '1994-06-22', 'Quibusdam delectus in amet quia eum ad consequatur.',
                      'efe688cb8e7b7a1c7a5ce6e9629310321bdc4bd4',
                      'http://lorempixel.com/640/480/',
                      'Aliquid neque libero quam cum asperiores. Rerum est est accusantium cupiditate et autem. Laudantium ea quia in non. Quisquam accusantium odit minus quae.',
                      'Adipisci et hic laborum doloribus.', 'Alias aut qui et mollitia et molestiae ipsa.',
                      'Quo dolorum incidunt et repellendus voluptas facilis.',
                      'Culpa repellat reprehenderit aut odio temporibus qui.',
                      'Sint itaque voluptas dicta cumque dolor voluptates ex. Rerum delectus rerum voluptatibus cum est modi debitis. In ipsam laboriosam est est magni. Neque dolorem dolor repudiandae dignissimos accusantiu',
                      'Laudantium at in magni tenetur.', @trans_result);
CALL teachers_fill_sp('Christina', 'Schmeler', 89945571545, 'matt.borer@example.net', 'male', 'Suriname', 'Feeneyshire',
                      '2016-02-19', 'Repellendus ut eius reiciendis quo a.', '8ae24479d9924e8157bef98dc5df5ff77e073cb9',
                      'http://lorempixel.com/640/480/',
                      'Minus omnis vero veniam et alias. Est ab porro eveniet. At facere aut quod. Est tenetur similique nam doloremque quia voluptates reiciendis.',
                      'Repudiandae rem et earum repudiandae corporis.',
                      'Incidunt deserunt est consectetur alias sed sint modi a.',
                      'Nobis nemo placeat similique optio.', 'Exercitationem eos facere est commodi neque.',
                      'Suscipit nobis unde ut tenetur quidem in. Voluptas perspiciatis non voluptatem rem officiis qui. Rem molestias sed qui eveniet amet est veritatis eius.',
                      'Iure eos officiis soluta.', @trans_result);
CALL teachers_fill_sp('General', 'Gleichner', 89956234862, 'zprohaska@example.net', 'other', 'Saint Barthelemy',
                      'Delilahburgh',
                      '1987-04-25', 'Voluptatem neque ducimus velit ducimus vel.',
                      '011ef5dc3cd47baf74d352fae42f05ce9886b13f',
                      'http://lorempixel.com/640/480/',
                      'Corrupti eligendi labore sapiente quo error expedita. Rerum et rem aut maiores laborum eos. At sit et sed odio iusto corrupti. Aliquid porro iste recusandae soluta consectetur.',
                      'Itaque nesciunt ut culpa nisi asperiores rem voluptatem.',
                      'Dolores quaerat nihil et libero molestias.',
                      'Et perspiciatis et reiciendis laboriosam rem corporis culpa.',
                      'Ut ut provident magnam dicta consequatur omnis omnis.',
                      'Sed voluptatum laudantium error nihil aut. Excepturi architecto labore molestiae quaerat. Voluptatem inventore et est voluptatem repellat fugiat.',
                      'Corrupti rerum dolor et.', @trans_result);
CALL teachers_fill_sp('Camron', 'Bechtelar', 89146244563, 'feeney.dayne@example.com', 'female', 'Burundi',
                      'Quentinville',
                      '2017-06-15', 'Consequatur ut harum rem inventore quis.',
                      '121b930d6c415c8064d716ac9893afbca306d10b',
                      'http://lorempixel.com/640/480/',
                      'Sit nobis sint non consequuntur voluptas sapiente aperiam modi. Ullam earum sequi non qui vero magnam. Et nobis tenetur maxime itaque fugiat consequatur numquam.',
                      'Et molestiae modi mollitia blanditiis ratione.', 'Veniam eos ea magnam dolorem commodi.',
                      'Quia repudiandae aut facilis natus aut.', 'Inventore at sunt et.',
                      'Vel sit sed quia. Eius eos sequi quo numquam eum voluptatum. Magnam ipsa dolor nam sit consequatur non cupiditate.',
                      'Voluptas vel sint nobis sed.', @trans_result);
CALL teachers_fill_sp('Edna', 'Dare', 89424649947, 'to\'keefe@example.net', 'female', 'Luxembourg', 'Beckerfort',
                      '1980-02-07',
                      'Qui voluptas quia itaque inventore.', '6b8c57245f14de4ce9da84a3590ec5ef71270ff7',
                      'http://lorempixel.com/640/480/',
                      'Non et dolor maiores non. Omnis dolores quisquam nihil a rerum voluptates. Esse ratione animi eaque labore non.',
                      'Dicta ea corporis doloremque dolor accusantium.',
                      'Earum perspiciatis officia ut sunt corrupti eveniet.',
                      'Minima a incidunt quas.', 'Molestiae ea ut deleniti illum.',
                      'Omnis molestiae saepe voluptate quo iure. Debitis omnis id voluptatibus voluptas error ducimus. Quod eum aspernatur quo. Est id fuga beatae consequatur.',
                      'Architecto quia ratione aspernatur et culpa harum.', @trans_result);
CALL teachers_fill_sp('Lionel', 'Breitenberg', 89493991261, 'glennie.o\'connell@example.com', 'other', 'Germany',
                      'Robertoview',
                      '1986-06-16', 'Voluptatum accusantium doloremque ab illo quam.',
                      'a191bed2a498ce604bf089c51fd14d578181917d',
                      'http://lorempixel.com/640/480/',
                      'Sint commodi velit voluptas quia. Molestiae eveniet officiis totam dignissimos inventore corporis omnis quisquam. Velit perferendis minima id in perferendis.',
                      'Tempora repellat rerum dolores at sapiente possimus.',
                      'Harum harum tempore iusto qui consequatur.',
                      'Sapiente consequatur expedita nisi ipsam.', 'Ab odio est temporibus eum quis.',
                      'Optio veniam qui doloremque est qui. Sunt nulla sit unde earum eaque nisi modi. Tenetur porro quo aut. Ut vel eos sed laudantium illo est quo aut. Et ut nobis esse delectus qui veritatis sapiente.',
                      'Qui ipsam non unde eos.', @trans_result);
CALL teachers_fill_sp('Concepcion', 'Monahan', 89093679592, 'ena.braun@example.net', 'male', 'Tunisia', 'North Jamey',
                      '1975-02-08', 'Minus quia suscipit sit.', 'd4171357f0ae2da183e1ea7b6c7504fdae72d142',
                      'http://lorempixel.com/640/480/',
                      'Itaque aut aliquid harum maiores ipsa a. Ex quam ducimus aut quis natus aut eum. Autem quod voluptatem consectetur velit animi ut.',
                      'Et at quia in sed vel a.', 'Ullam qui repellat quae sed.',
                      'Quis assumenda culpa laudantium aut est.',
                      'A ut alias expedita.',
                      'Ex nemo minus adipisci ratione exercitationem molestiae. Tenetur mollitia et est et. Temporibus atque reprehenderit eaque aspernatur. Laborum aut quam voluptatem consequatur minus omnis.',
                      'Voluptas nesciunt est cum rerum.', @trans_result);
CALL teachers_fill_sp('Leone', 'Nikolaus', 89233926913, 'oral.kirlin@example.com', 'female', 'Christmas Island',
                      'Arashire',
                      '1973-09-17', 'Nulla iure esse nesciunt voluptates alias ut ut.',
                      '139ef596cd243739652f4d0930725fb49616bb7c',
                      'http://lorempixel.com/640/480/',
                      'Sed omnis fuga delectus ad. Consequatur eius voluptas iste qui libero qui quod. Natus accusamus commodi quae eveniet quidem.',
                      'Ducimus aut in esse eum provident delectus.', 'Debitis maiores alias ad deserunt odit earum.',
                      'Ut et ad vitae maxime possimus.', 'Delectus est non amet laboriosam.',
                      'Unde fuga fuga amet sed voluptatem. Harum asperiores molestiae consequatur quasi illo vero quaerat. Et qui vel eum nostrum rerum et.',
                      'Eum reiciendis nesciunt cupiditate omnis nam corporis.', @trans_result);
CALL teachers_fill_sp('Ottilie', 'Bogisich', 89643498967, 'ross85@example.net', 'male', 'Haiti', 'Masonfurt',
                      '1994-03-14',
                      'Illo facere ab qui expedita velit distinctio amet.', 'd6272bea847d94ae616dfb0f5f74954480ba6f19',
                      'http://lorempixel.com/640/480/',
                      'Quod dignissimos sequi minus fuga. Deserunt distinctio nam et ut totam.\nAliquid veniam nesciunt perferendis quam. Aut qui ipsa vero quo eos non dolores sed. Quasi deleniti aliquid dolorum corporis.',
                      'Laboriosam temporibus molestiae minus vero officiis.',
                      'Consequatur non eum illo eum error laboriosam.',
                      'Quia numquam adipisci ut error.', 'Numquam et nobis ex aut.',
                      'Facere cum doloremque aut occaecati vel sint esse. Qui porro et quibusdam deserunt dolor et illum. Tempore et consequuntur eos voluptas.',
                      'Est pariatur sequi ipsam atque omnis.', @trans_result);
CALL teachers_fill_sp('Sasha', 'Dickens', 89035564780, 'beverly18@example.net', 'male', 'Norfolk Island',
                      'Luettgenmouth',
                      '1986-06-24', 'Vel quia neque et est optio alias alias et.',
                      '98369727d48d1f88f60dd8cda740a24d9a1e94c6',
                      'http://lorempixel.com/640/480/',
                      'Et eos sunt laboriosam et. Aliquid in accusamus consequuntur deserunt. Temporibus sed modi aut qui.',
                      'Deserunt est magni perspiciatis quos ipsa enim illo.', 'Qui quia facilis velit vero explicabo.',
                      'Excepturi numquam quam eum sint in dolore.', 'Accusamus porro et sapiente ea.',
                      'Reprehenderit praesentium nihil sed consequatur qui. Iste quidem unde iure repellat blanditiis perferendis. Ea quam culpa enim vero.',
                      'Repudiandae cupiditate repellendus vel.', @trans_result);
CALL teachers_fill_sp('Stanford', 'Gislason', 89122353175, 'aida.krajcik@example.org', 'female', 'South Africa',
                      'Pearlineside',
                      '1997-06-10', 'Rerum atque quod est ut fugiat id.', '0ba51d4affc8947b42c8197dbaaca74b4a6e452b',
                      'http://lorempixel.com/640/480/',
                      'Vitae et eos nulla a autem quos. Accusamus et exercitationem perspiciatis labore. Numquam aspernatur odio veritatis cumque dolorem accusamus. Et perferendis vitae iste magni sed mollitia.',
                      'Iure veniam dolor numquam.', 'Facere labore non qui minima et aspernatur.',
                      'Hic unde molestiae voluptatibus illo iste atque possimus et.',
                      'A molestiae aut voluptates omnis in pariatur blanditiis nostrum.',
                      'Et ut culpa non voluptatem omnis pariatur occaecati ea. Qui quia temporibus magnam at maxime iusto fugit nam. Soluta sed aut qui eligendi id et.',
                      'Enim in dolor dolor.', @trans_result);
CALL teachers_fill_sp('Osvaldo', 'Ziemann', 89001750955, 'pschinner@example.org', 'other', 'Afghanistan', 'Beahanville',
                      '2000-12-21', 'Natus et quis est ducimus aut voluptatem voluptas sit.',
                      'fab15c117c1416c9c33709d80c3253cd46488ab7', 'http://lorempixel.com/640/480/',
                      'Asperiores sapiente sit sint saepe ut qui. Omnis voluptatem sit quia pariatur aut ducimus et. Architecto et beatae voluptas.',
                      'Facere sit et quibusdam vitae iste.', 'Qui et repellendus tenetur cum.',
                      'Omnis minus atque necessitatibus.',
                      'Autem beatae repellat nesciunt sapiente quia impedit.',
                      'Enim saepe nobis voluptatem dolorem facere. Est sed quo consequatur voluptatem magnam vel.',
                      'Eveniet autem adipisci quos est sed voluptatem sed.', @trans_result);
CALL teachers_fill_sp('Obie', 'Gorczany', 89761267181, 'sammie.kilback@example.com', 'male', 'Algeria', 'Luettgenhaven',
                      '2013-09-12', 'Voluptatem odit placeat officia nisi.', 'f09ec2edcc5b6646b83f23573058eaa8cb7f5f94',
                      'http://lorempixel.com/640/480/',
                      'Qui et qui sunt et omnis illum. Fugit aliquam laboriosam dolorum eum. Culpa rerum eum unde est recusandae cupiditate atque fugiat. Dolor aliquid aut perferendis voluptatem.',
                      'Aliquid quibusdam enim aperiam ut.',
                      'Voluptas impedit sit quo totam necessitatibus perspiciatis id.',
                      'Et cupiditate vitae minima omnis et.', 'Mollitia commodi sit vel.',
                      'Omnis veniam exercitationem enim sunt in voluptatibus est quaerat. Reprehenderit nihil est quia voluptatem unde laudantium. Est consequatur quam quos laudantium animi repellat quia. Doloribus ducimus ',
                      'Mollitia molestiae et tenetur quisquam non.', @trans_result);
CALL teachers_fill_sp('Morgan', 'Schaden', 89437821116, 'cloyd.zemlak@example.net', 'male', 'Zambia', 'North Lambert',
                      '1976-06-09', 'Quia rem enim vel aliquam.', '0251cd84301e7d102cf6194f47b6d44321603e7a',
                      'http://lorempixel.com/640/480/',
                      'Corrupti voluptatum ipsa a et. Repudiandae aut ut ipsum dolorum illo. Quam voluptate animi iste numquam earum nobis. Ut nulla quae temporibus a.',
                      'Ipsum voluptates enim non voluptates quidem magnam.',
                      'Minima officia perspiciatis qui ab ut ratione.',
                      'Maxime libero ut architecto.', 'Quas aut at et voluptas.',
                      'Ad et distinctio est eum vel sed. Praesentium architecto est dignissimos magni sit aliquid similique et. Nihil aut aut minima ut esse sint. Eos assumenda et in.',
                      'Unde voluptatibus totam vel soluta in quas.', @trans_result);


INSERT INTO `courses`
VALUES (1, 'Consequuntur molestiae non nisi reiciendis voluptas.'),
       (2, 'Nostrum nulla sint quam quam et nam laboriosam.'),
       (3, 'Nihil sint ad sit in occaecati at et.'),
       (4, 'Saepe ea possimus harum sit.'),
       (5, 'Rem nam iste minus dolore est harum voluptates.'),
       (6, 'Sed dolorum in voluptas sunt.'),
       (7, 'Reiciendis qui quod qui tenetur.'),
       (8, 'Autem et eum ipsum nobis sequi id.'),
       (9, 'Sed inventore earum blanditiis recusandae sequi qui modi.'),
       (10, 'Repudiandae in autem ducimus fuga omnis temporibus.'),
       (11, 'Ullam alias sed vero officia distinctio.'),
       (12, 'Fugiat non nobis labore mollitia nemo sint.'),
       (13, 'Explicabo tenetur porro doloribus nesciunt at qui.'),
       (14, 'Eaque sit qui numquam molestiae aut quos id.'),
       (15, 'Aut non blanditiis dolor.'),
       (16, 'Voluptatem qui ex eos dolor est maiores quibusdam.'),
       (17, 'Eos quos tempore quo.'),
       (18, 'Eaque placeat quibusdam est ut et qui blanditiis.'),
       (19, 'Omnis facere voluptatem aut aspernatur eum non velit.'),
       (20, 'Velit in eius eligendi eligendi.'),
       (21, 'Ex adipisci quos quia occaecati totam tempora corporis.'),
       (22, 'Et quia omnis omnis quam.'),
       (23, 'Accusantium impedit sit voluptatem assumenda facilis mollitia modi.'),
       (24, 'Quia consequuntur ut adipisci error.'),
       (25, 'Eum incidunt distinctio voluptas quia adipisci.'),
       (26, 'Libero minus facere quo doloribus aut veniam soluta.'),
       (27, 'Sit sit asperiores qui sunt eum rerum.'),
       (28, 'Ut dicta sit rerum voluptas mollitia.'),
       (29, 'Et et nam non.'),
       (30, 'Natus odit itaque eligendi nesciunt.'); -- 30


INSERT INTO `programms_courses`
VALUES (1, 10),
       (1, 17),
       (1, 26),
       (2, 10),
       (2, 18),
       (2, 25),
       (3, 11),
       (3, 28),
       (4, 12),
       (4, 14),
       (4, 18),
       (5, 18),
       (5, 22),
       (5, 26),
       (6, 13),
       (6, 26),
       (6, 29),
       (7, 11),
       (7, 14),
       (7, 19),
       (8, 22),
       (8, 24),
       (8, 27),
       (9, 12),
       (9, 13),
       (9, 23),
       (10, 9),
       (10, 18),
       (10, 30); -- 22 c 9-30 курс


INSERT INTO `specializations_courses`
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8); -- 8 c 1-8 курс


INSERT INTO `courses_teachers`
VALUES (1, 36),
       (2, 37),
       (3, 38),
       (4, 39),
       (5, 40),
       (6, 41),
       (7, 42),
       (8, 43),
       (9, 44),
       (10, 45),
       (11, 46),
       (12, 47),
       (13, 48),
       (14, 49),
       (15, 50),
       (16, 36),
       (17, 37),
       (18, 38),
       (19, 39),
       (20, 40),
       (21, 41),
       (22, 42),
       (23, 43),
       (24, 44),
       (25, 45),
       (26, 46),
       (27, 47),
       (28, 48),
       (29, 49),
       (30, 50); -- 50


INSERT INTO `courses_mentors`
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 1),
       (12, 2),
       (13, 3),
       (14, 4),
       (15, 5),
       (16, 6),
       (17, 7),
       (18, 8),
       (19, 9),
       (20, 10),
       (21, 1),
       (22, 2),
       (23, 3),
       (24, 4),
       (25, 5),
       (26, 6),
       (27, 7),
       (28, 8),
       (29, 9),
       (30, 10); -- 30


INSERT INTO `lessons`
VALUES (1, 1, 1, 'Placeat quis sint quia itaque voluptas dolor.'),
       (2, 2, 1, 'Qui eum veniam quo mollitia accusantium nemo debitis dolorum.'),
       (3, 3, 1, 'Id et vel labore fugiat.'),
       (4, 1, 2, 'Atque vel repellendus mollitia sed similique maxime.'),
       (5, 2, 2, 'Pariatur aut vitae omnis veritatis.'),
       (6, 3, 2, 'Cupiditate rerum qui omnis omnis.'),
       (7, 1, 3, 'Amet adipisci eum est odio in nam et.'),
       (8, 2, 3, 'Reprehenderit repellat eum sed aspernatur consequatur facere.'),
       (9, 3, 3, 'Dolor quis quisquam voluptatem ducimus autem.'),
       (10, 4, 3, 'Quia quia aut quia architecto quod est accusantium.'),
       (11, 1, 4, 'Deleniti nihil beatae enim necessitatibus unde non.'),
       (12, 2, 4, 'Ab illo dolorem itaque dignissimos dolorem.'),
       (13, 3, 4, 'Facilis eum et consequatur minima.'),
       (14, 1, 5, 'Voluptatum cupiditate voluptatem sit sit ut et.'),
       (15, 2, 5, 'Corrupti voluptatem molestiae occaecati eligendi.'),
       (16, 3, 5, 'Qui rerum aut et deserunt.'),
       (17, 4, 5, 'Eos tenetur debitis voluptates non veritatis.'),
       (18, 5, 5, 'Non et corporis ipsum voluptatem.'),
       (19, 1, 6, 'Porro eius dolorem eos qui non dolorem dolores.'),
       (20, 2, 6, 'Quasi aspernatur facilis est eligendi ipsa ipsum.'),
       (21, 3, 6, 'Omnis hic ut adipisci culpa autem eaque sequi.'),
       (22, 1, 7, 'Enim autem harum sed at nemo sed.'),
       (23, 2, 7, 'Eos rerum consequuntur pariatur nostrum sed et.'),
       (24, 3, 7, 'Aliquid enim expedita ipsam voluptatibus et aperiam.'),
       (25, 4, 7, 'Officiis ipsum deleniti odit exercitationem tempora nam tenetur in.'),
       (26, 1, 8, 'Amet perferendis quia quo dolores cumque.'),
       (27, 2, 8, 'Consequatur voluptates doloribus et sint.'),
       (28, 3, 8, 'Commodi inventore quod facere voluptas quas aut.'),
       (29, 1, 9, 'Eveniet molestias libero corporis.'),
       (30, 2, 9, 'Et iusto non sint quisquam sit hic sit.'),
       (31, 3, 9, 'Excepturi odio et et eos autem ea.'),
       (32, 4, 9, 'Voluptatum ratione eum quam qui et.'),
       (33, 1, 10, 'Enim sed quam quidem.'),
       (34, 2, 10, 'Voluptatem laborum aliquam velit dignissimos magni.'),
       (35, 3, 10, 'Distinctio autem iste et id quas.'),
       (36, 1, 11, 'Laudantium tempora accusamus eos veniam nam animi ipsam.'),
       (37, 2, 11, 'Voluptatum earum cumque aut omnis.'),
       (38, 3, 11, 'Ut quae eum repellat ut dolore voluptatibus.'),
       (39, 1, 12, 'Unde atque eum rerum temporibus.'),
       (40, 2, 12, 'Omnis iure dolores sint atque similique.'),
       (41, 3, 12, 'Sunt ducimus sed non repudiandae laborum.'),
       (42, 1, 13, 'Optio qui dolore aut animi nihil illo dolore.'),
       (43, 2, 13, 'Nesciunt quia enim dicta ut repellat quas.'),
       (44, 3, 13, 'At quia nam molestias omnis autem at aut iusto.'),
       (45, 4, 13, 'Ea maiores repellat similique ab natus.'),
       (46, 1, 14, 'Nulla nam autem ducimus voluptatem quo et quam.'),
       (47, 2, 14, 'Voluptatem voluptate reiciendis enim officia facilis et aut.'),
       (48, 3, 14, 'Magnam quia et asperiores est ullam.'),
       (49, 1, 15, 'Quis voluptatem nulla sunt aut sit velit.'),
       (50, 2, 15, 'Vero beatae dolores inventore cupiditate.'),
       (51, 3, 15, 'Ut beatae dolorum sed libero.'),
       (52, 1, 16, 'Fuga maiores repudiandae saepe aut omnis qui occaecati.'),
       (53, 2, 16, 'Atque molestias sed dolores.'),
       (54, 3, 16, 'Et repudiandae facere tempore et aut quia.'),
       (55, 4, 16, 'Dolores et et ut quod asperiores est qui cum.'),
       (56, 1, 17, 'Minus atque quia libero qui in dolores.'),
       (57, 2, 17, 'Deleniti ratione reprehenderit quo laudantium.'),
       (58, 3, 17, 'Optio alias eaque ab aspernatur rerum.'),
       (59, 1, 18, 'Quos eum voluptatem ea occaecati rerum.'),
       (60, 2, 18, 'Sunt tempora architecto quis rerum est delectus nam.'),
       (61, 3, 18, 'Aut fugit facilis explicabo architecto sed minima sit.'),
       (62, 4, 18, 'Sit eos omnis similique cupiditate porro voluptates.'),
       (63, 1, 19, 'Reiciendis eos nulla quo optio incidunt occaecati laudantium.'),
       (64, 2, 19, 'Laboriosam voluptatem recusandae sapiente cumque.'),
       (65, 3, 19, 'Non maxime rerum repellendus nihil optio ea debitis.'),
       (66, 1, 20, 'Eum iste odit dolorem dignissimos autem qui occaecati.'),
       (67, 2, 20, 'Quis dolor excepturi dolor ullam praesentium et dolor.'),
       (68, 3, 20, 'Minus earum recusandae expedita vero iure enim.'),
       (69, 4, 20, 'Eveniet ratione voluptas sit commodi.'),
       (70, 1, 21, 'Non quidem ea adipisci sed optio.'),
       (71, 2, 21, 'Non impedit sed possimus eum fugit magnam aut.'),
       (72, 3, 21, 'Est quae consequatur sed dolorum.'),
       (73, 1, 22, 'A iure sint enim impedit.'),
       (74, 2, 22, 'Tempora deserunt quis consectetur.'),
       (75, 3, 22, 'Id dignissimos minima asperiores odio.'),
       (76, 4, 22, 'Illo quisquam quis vel sed et sapiente dicta.'),
       (77, 1, 23, 'Deserunt qui assumenda aut suscipit blanditiis.'),
       (78, 2, 23, 'Tempora rerum animi temporibus dolorum.'),
       (79, 3, 23, 'Consequatur dolorem dolores totam pariatur aut.'),
       (80, 1, 24, 'Doloribus incidunt pariatur cum consequatur eius vel animi.'),
       (81, 2, 24, 'Corporis similique amet cum aut perferendis quidem.'),
       (82, 3, 24, 'Harum quae aliquid atque quas aut eos possimus.'),
       (83, 1, 25, 'Aut at ducimus vero inventore quo quos natus.'),
       (84, 2, 25, 'Est animi ut molestias aut numquam unde reiciendis sequi.'),
       (85, 3, 25, 'Dolores at tenetur inventore ullam.'),
       (86, 1, 26, 'Quasi provident quasi sed maiores harum.'),
       (87, 2, 26, 'Dolorem distinctio vel est perspiciatis aliquid tempore.'),
       (88, 3, 26, 'Eligendi animi est sint vel.'),
       (89, 4, 26, 'Voluptas odit qui rerum ut quo quia fuga.'),
       (90, 1, 27, 'Est nesciunt et labore odit est sunt totam placeat.'),
       (91, 2, 27, 'Voluptatem magnam porro beatae accusantium animi.'),
       (92, 3, 27, 'Itaque at voluptatem fugiat qui expedita eum omnis.'),
       (93, 1, 28, 'Quis repellendus rerum reiciendis sint aut.'),
       (94, 2, 28, 'Esse corporis velit tempore magni nostrum.'),
       (95, 3, 28, 'Maxime enim et officia mollitia.'),
       (96, 4, 28, 'Fugiat itaque dolor nisi quibusdam id et.'),
       (97, 1, 29, 'Tenetur est sapiente occaecati.'),
       (98, 2, 29, 'Quaerat modi sed eos vel quae.'),
       (99, 1, 30, 'Architecto ea similique eos fuga consequatur unde et.'),
       (100, 2, 30, 'Aut quia at iure ea sed dolorum officia.');
-- 100


-- fill table schedule:
INSERT INTO `schedule` (date, teacher_id, group_id, lesson_number, course_id, mentor_id)
VALUES ('2021-03-05 10:00:00', 45, 1, 1, 10, 10),
       ('2021-03-07 10:00:00', 45, 1, 2, 10, 10),
       ('2021-03-09 15:00:00', 45, 1, 3, 10, 10),
       ('2021-03-11 15:00:00', 37, 1, 1, 17, 7),
       ('2021-03-13 15:00:00', 37, 1, 2, 17, 7),
       ('2021-03-15 15:00:00', 37, 1, 3, 17, 7),
       ('2021-03-17 15:00:00', 46, 1, 1, 26, 6),
       ('2021-03-19 15:00:00', 46, 1, 2, 26, 6),
       ('2021-03-21 15:00:00', 46, 1, 3, 26, 6),
       ('2021-03-23 15:00:00', 46, 1, 4, 26, 6),
       ('2021-03-25 15:00:00', 36, 1, 1, 1, 1),
       ('2021-03-28 15:00:00', 36, 1, 2, 1, 1),
       ('2021-04-01 15:00:00', 36, 1, 3, 1, 1),
       ('2021-03-17 20:00:00', 46, 2, 1, 26, 6),
       ('2021-03-19 20:00:00', 46, 2, 2, 26, 6),
       ('2021-03-21 20:00:00', 46, 2, 3, 26, 6),
       ('2021-03-23 20:00:00', 48, 2, 1, 13, 3),
       ('2021-03-25 20:00:00', 48, 2, 2, 13, 3),
       ('2021-03-27 20:00:00', 48, 2, 3, 13, 3),
       ('2021-03-30 19:00:00', 48, 2, 4, 13, 3),
       ('2021-04-02 10:00:00', 49, 2, 1, 29, 9),
       ('2021-04-05 10:00:00', 49, 2, 2, 29, 9),
       ('2021-04-07 10:00:00', 39, 2, 1, 4, 4),
       ('2021-04-09 10:00:00', 39, 2, 2, 4, 4),
       ('2021-04-11 10:00:00', 39, 2, 3, 4, 4),
       ('2021-03-05 20:00:00', 38, 3, 1, 18, 8),
       ('2021-03-07 20:00:00', 38, 3, 2, 18, 8),
       ('2021-03-09 20:00:00', 38, 3, 3, 18, 8),
       ('2021-03-11 20:00:00', 38, 3, 4, 18, 8),
       ('2021-03-13 20:00:00', 42, 3, 1, 22, 2),
       ('2021-03-15 20:00:00', 42, 3, 2, 22, 2),
       ('2021-03-17 20:00:00', 42, 3, 3, 22, 2),
       ('2021-03-19 20:00:00', 42, 3, 4, 22, 2),
       ('2021-03-22 15:00:00', 46, 3, 1, 26, 6),
       ('2021-03-25 15:00:00', 46, 3, 2, 26, 6),
       ('2021-03-27 15:00:00', 46, 3, 3, 26, 6),
       ('2021-03-29 15:00:00', 46, 3, 4, 26, 6),
       ('2021-03-31 20:00:00', 40, 3, 1, 5, 5),
       ('2021-04-02 20:00:00', 40, 3, 2, 5, 5),
       ('2021-04-04 20:00:00', 40, 3, 3, 5, 5),
       ('2021-04-06 20:00:00', 40, 3, 4, 5, 5),
       ('2021-04-08 20:00:00', 40, 3, 5, 5, 5),
       ('2021-03-23 13:00:00', 48, 4, 1, 13, 3),
       ('2021-03-25 13:00:00', 48, 4, 2, 13, 3),
       ('2021-03-27 13:00:00', 48, 4, 3, 13, 3),
       ('2021-03-29 13:00:00', 48, 4, 4, 13, 3),
       ('2021-03-31 20:00:00', 46, 4, 1, 26, 6),
       ('2021-04-02 20:00:00', 46, 4, 2, 26, 6),
       ('2021-04-04 20:00:00', 46, 4, 3, 26, 6),
       ('2021-04-06 20:00:00', 46, 4, 4, 26, 6),
       ('2021-04-10 15:00:00', 49, 4, 1, 29, 9),
       ('2021-04-12 15:00:00', 49, 4, 2, 29, 9),
       ('2021-04-14 15:00:00', 37, 4, 1, 2, 2),
       ('2021-04-16 15:00:00', 37, 4, 2, 2, 2),
       ('2021-04-18 15:00:00', 37, 4, 3, 2, 2),
       ('2021-03-05 12:00:00', 38, 5, 1, 18, 8),
       ('2021-03-07 12:00:00', 38, 5, 2, 18, 8),
       ('2021-03-09 12:00:00', 38, 5, 3, 18, 8),
       ('2021-03-11 12:00:00', 38, 5, 4, 18, 8),
       ('2021-03-13 12:00:00', 42, 5, 1, 22, 2),
       ('2021-03-15 12:00:00', 42, 5, 2, 22, 2),
       ('2021-03-17 12:00:00', 42, 5, 3, 22, 2),
       ('2021-03-19 12:00:00', 42, 5, 4, 22, 2),
       ('2021-03-22 10:00:00', 46, 5, 1, 26, 6),
       ('2021-03-24 10:00:00', 46, 5, 2, 26, 6),
       ('2021-03-26 10:00:00', 46, 5, 3, 26, 6),
       ('2021-03-28 10:00:00', 46, 5, 4, 26, 6),
       ('2021-03-30 12:00:00', 38, 5, 1, 3, 3),
       ('2021-04-01 12:00:00', 38, 5, 2, 3, 3),
       ('2021-04-03 12:00:00', 38, 5, 3, 3, 3),
       ('2021-04-05 12:00:00', 38, 5, 4, 3, 3);


INSERT INTO `practicals`
VALUES (1, 'http://lorempixel.com/640/480/'),
       (2, 'http://lorempixel.com/640/480/'),
       (3, 'http://lorempixel.com/640/480/'),
       (4, 'http://lorempixel.com/640/480/'),
       (5, 'http://lorempixel.com/640/480/'),
       (6, 'http://lorempixel.com/640/480/'),
       (7, 'http://lorempixel.com/640/480/'),
       (8, 'http://lorempixel.com/640/480/'),
       (9, 'http://lorempixel.com/640/480/'),
       (10, 'http://lorempixel.com/640/480/'),
       (11, 'http://lorempixel.com/640/480/'),
       (12, 'http://lorempixel.com/640/480/'),
       (13, 'http://lorempixel.com/640/480/'),
       (14, 'http://lorempixel.com/640/480/'),
       (15, 'http://lorempixel.com/640/480/'),
       (16, 'http://lorempixel.com/640/480/'),
       (17, 'http://lorempixel.com/640/480/'),
       (18, 'http://lorempixel.com/640/480/'),
       (19, 'http://lorempixel.com/640/480/'),
       (20, 'http://lorempixel.com/640/480/'),
       (21, 'http://lorempixel.com/640/480/'),
       (22, 'http://lorempixel.com/640/480/'),
       (23, 'http://lorempixel.com/640/480/'),
       (24, 'http://lorempixel.com/640/480/'),
       (25, 'http://lorempixel.com/640/480/'),
       (26, 'http://lorempixel.com/640/480/'),
       (27, 'http://lorempixel.com/640/480/'),
       (28, 'http://lorempixel.com/640/480/'),
       (29, 'http://lorempixel.com/640/480/'),
       (30, 'http://lorempixel.com/640/480/'),
       (31, 'http://lorempixel.com/640/480/'),
       (32, 'http://lorempixel.com/640/480/'),
       (33, 'http://lorempixel.com/640/480/'),
       (34, 'http://lorempixel.com/640/480/'),
       (35, 'http://lorempixel.com/640/480/'),
       (36, 'http://lorempixel.com/640/480/'),
       (37, 'http://lorempixel.com/640/480/'),
       (38, 'http://lorempixel.com/640/480/'),
       (39, 'http://lorempixel.com/640/480/'),
       (40, 'http://lorempixel.com/640/480/'),
       (41, 'http://lorempixel.com/640/480/'),
       (42, 'http://lorempixel.com/640/480/'),
       (43, 'http://lorempixel.com/640/480/'),
       (44, 'http://lorempixel.com/640/480/'),
       (45, 'http://lorempixel.com/640/480/'),
       (46, 'http://lorempixel.com/640/480/'),
       (47, 'http://lorempixel.com/640/480/'),
       (48, 'http://lorempixel.com/640/480/'),
       (49, 'http://lorempixel.com/640/480/'),
       (50, 'http://lorempixel.com/640/480/'),
       (51, 'http://lorempixel.com/640/480/'),
       (52, 'http://lorempixel.com/640/480/'),
       (53, 'http://lorempixel.com/640/480/'),
       (54, 'http://lorempixel.com/640/480/'),
       (55, 'http://lorempixel.com/640/480/'),
       (56, 'http://lorempixel.com/640/480/'),
       (57, 'http://lorempixel.com/640/480/'),
       (58, 'http://lorempixel.com/640/480/'),
       (59, 'http://lorempixel.com/640/480/'),
       (60, 'http://lorempixel.com/640/480/'),
       (61, 'http://lorempixel.com/640/480/'),
       (62, 'http://lorempixel.com/640/480/'),
       (63, 'http://lorempixel.com/640/480/'),
       (64, 'http://lorempixel.com/640/480/'),
       (65, 'http://lorempixel.com/640/480/'),
       (66, 'http://lorempixel.com/640/480/'),
       (67, 'http://lorempixel.com/640/480/'),
       (68, 'http://lorempixel.com/640/480/'),
       (69, 'http://lorempixel.com/640/480/'),
       (70, 'http://lorempixel.com/640/480/'),
       (71, 'http://lorempixel.com/640/480/'),
       (72, 'http://lorempixel.com/640/480/'),
       (73, 'http://lorempixel.com/640/480/'),
       (74, 'http://lorempixel.com/640/480/'),
       (75, 'http://lorempixel.com/640/480/'),
       (76, 'http://lorempixel.com/640/480/'),
       (77, 'http://lorempixel.com/640/480/'),
       (78, 'http://lorempixel.com/640/480/'),
       (79, 'http://lorempixel.com/640/480/'),
       (80, 'http://lorempixel.com/640/480/'),
       (81, 'http://lorempixel.com/640/480/'),
       (82, 'http://lorempixel.com/640/480/'),
       (83, 'http://lorempixel.com/640/480/'),
       (84, 'http://lorempixel.com/640/480/'),
       (85, 'http://lorempixel.com/640/480/'),
       (86, 'http://lorempixel.com/640/480/'),
       (87, 'http://lorempixel.com/640/480/'),
       (88, 'http://lorempixel.com/640/480/'),
       (89, 'http://lorempixel.com/640/480/'),
       (90, 'http://lorempixel.com/640/480/'),
       (91, 'http://lorempixel.com/640/480/'),
       (92, 'http://lorempixel.com/640/480/'),
       (93, 'http://lorempixel.com/640/480/'),
       (94, 'http://lorempixel.com/640/480/'),
       (95, 'http://lorempixel.com/640/480/'),
       (96, 'http://lorempixel.com/640/480/'),
       (97, 'http://lorempixel.com/640/480/'),
       (98, 'http://lorempixel.com/640/480/'),
       (99, 'http://lorempixel.com/640/480/'),
       (100, 'http://lorempixel.com/640/480/');
-- 100


-- fill table students_practicals:
INSERT INTO `students_practicals`
VALUES (1, 2, '2021-03-29 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (1, 33, '2021-03-06 10:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (1, 35, '2021-03-16 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (1, 57, '2021-03-26 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (1, 86, '2021-03-23 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (1, 89, '2021-03-30 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (3, 14, '2021-04-10 20:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (3, 18, '2021-04-16 20:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (3, 74, '2021-03-15 20:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (4, 42, '2021-03-25 13:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (4, 87, '2021-04-15 20:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (4, 98, '2021-04-21 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (5, 9, '2021-04-16 12:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (5, 88, '2021-03-30 10:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (7, 42, '2021-03-27 19:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (7, 87, '2021-03-20 20:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (7, 98, '2021-04-12 10:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (9, 4, '2021-04-27 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (10, 44, '2021-03-30 13:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (10, 88, '2021-04-16 20:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (12, 13, '2021-04-23 10:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (14, 6, '2021-04-24 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (14, 42, '2021-03-29 13:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (16, 1, '2021-03-27 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (23, 16, '2021-04-18 20:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (24, 5, '2021-04-16 20:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (24, 98, '2021-04-24 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (25, 8, '2021-04-10 12:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (25, 60, '2021-03-12 15:00:00', 'http://lorempixel.com/640/480/');
INSERT INTO `students_practicals`
VALUES (25, 74, '2021-03-20 12:00:00', 'http://lorempixel.com/640/480/'); -- 30


INSERT INTO `messages`
VALUES (1, 2,
        'Nobis quia et tempore ducimus. Exercitationem aliquam sit dolor numquam incidunt. Et at ut consequatur qui officia dolore maiores. Rerum sit debitis exercitationem repudiandae eligendi.',
        '2021-03-30 13:00:00'),
       (2, 1,
        'Qui culpa id quis molestias unde. Rem numquam aspernatur ipsa consequuntur soluta. Aut id et quia eaque nostrum praesentium. Maiores quia aut tempore velit qui.',
        '2021-03-30 13:00:00'),
       (3, 1,
        'Atque excepturi natus et sed. Sunt ipsum suscipit ut tempora enim id et. Eum ut facere ab adipisci. Facilis accusantium molestiae quibusdam id minima ut. Consectetur explicabo minus vitae ipsa ut.',
        '2021-03-30 13:00:00'),
       (1, 3,
        'Quia iste voluptas et culpa aut et ullam modi. Debitis cum vel accusantium sed. Et nulla aut rerum voluptatem nam nemo et.',
        '2021-03-30 13:00:00'),
       (5, 4,
        'Voluptatem tempora beatae sed ut. Optio et doloribus officiis rerum error et culpa. In autem aspernatur cupiditate. Dignissimos unde similique modi.',
        '2021-03-30 13:00:00'),
       (4, 5,
        'Facere quia fugit alias reprehenderit et. Tempore eos saepe itaque impedit quos animi. Incidunt sequi ut molestiae perspiciatis laborum porro id. Est illum aperiam magnam veniam.',
        '2021-03-30 13:00:00'),
       (7, 6, 'Qui voluptatem eligendi officiis quisquam unde nemo. Laudantium occaecati dolore quia nihil.',
        '2021-03-30 13:00:00'),
       (8, 6,
        'Voluptas suscipit asperiores consequatur ipsam sunt omnis. Aliquid et voluptate voluptatem ut accusantium labore vitae.',
        '2021-03-30 13:00:00'),
       (6, 9, 'Temporibus dolores et consequatur dolorem rerum dignissimos. Atque saepe sit quos sed.',
        '2021-03-30 13:00:00'),
       (6, 10,
        'Nihil dolorum itaque veritatis molestias aut occaecati sequi. Quis libero provident labore sit repellendus. Est vitae qui consequatur sequi pariatur non.',
        '2021-03-30 13:00:00'),
       (11, 7,
        'Id beatae ut veritatis dolorem. Perferendis consequatur officia et. Qui officiis culpa dolore eaque id voluptatem quia. Eveniet consequuntur harum blanditiis tenetur veritatis blanditiis dicta.',
        '2021-03-30 13:00:00'),
       (7, 12,
        'Eum culpa quo nobis consequuntur non dolorum dignissimos et. Fuga nobis et aut aut dolores. Omnis quisquam voluptates deserunt. At vel voluptate veritatis et tenetur aut rerum.',
        '2021-03-30 13:00:00'),
       (12, 13,
        'Hic omnis voluptatem sunt et nihil nihil. Rem molestias maiores nihil est voluptates occaecati. Quia aut natus ipsum. Nihil omnis consequatur quo.',
        '2021-03-30 13:00:00'),
       (5, 14,
        'Laboriosam aliquam unde qui repellendus distinctio. Ipsa rerum laboriosam molestiae dolores hic vel repellendus. Similique consequatur eaque corporis necessitatibus debitis itaque rerum aliquid.',
        '2021-03-30 13:00:00'),
       (15, 11,
        'Assumenda et dolorem eveniet amet sed aut. Velit esse quae ipsum cupiditate cupiditate. Necessitatibus alias tempore quisquam atque. Omnis voluptatem asperiores est nihil et.',
        '2021-03-30 13:00:00'),
       (12, 16,
        'Sit et repellendus distinctio ratione est. Illum tempore et inventore eligendi est ipsum doloremque nulla. Vel dicta cum exercitationem eveniet.',
        '2021-03-30 13:00:00'),
       (5, 17,
        'Repellendus at est aut molestiae voluptatem. Cumque ea expedita officiis qui. Voluptatem qui officia quia non voluptas rerum cum.',
        '2021-03-30 13:00:00'),
       (1, 18,
        'Natus omnis molestiae reprehenderit quas in accusantium. Commodi alias aut suscipit libero assumenda sunt. Eos doloremque debitis fugiat autem atque.',
        '2021-03-30 13:00:00'),
       (19, 14,
        'Quis ad doloremque eaque et et. Asperiores pariatur harum laboriosam qui. Nesciunt quaerat qui qui necessitatibus alias doloremque molestiae. Fugiat illum qui nostrum debitis.',
        '2021-03-30 13:00:00'),
       (14, 20,
        'Doloremque iusto quidem inventore delectus voluptate sit ducimus aut. Hic vero iusto cupiditate quia. Fugiat sunt natus debitis et. Quo alias quisquam non ut.',
        '2021-03-30 13:00:00'),
       (20, 21,
        'Animi quibusdam doloribus dolorum. Qui aut tempore in non. Excepturi et autem dignissimos et est at ex. Eum aperiam tempore molestiae.',
        '2021-03-30 13:00:00'),
       (21, 20,
        'Cum dolores corporis fugiat natus quae explicabo. Qui officiis veniam temporibus nemo explicabo porro. Eius mollitia ea omnis eum. Repellendus ut corrupti esse debitis et similique incidunt.',
        '2021-03-30 13:00:00'),
       (23, 15,
        'Recusandae earum quisquam nobis non. Nesciunt iste dolores nam necessitatibus itaque. Culpa sed et ab cum aliquam blanditiis nihil.',
        '2021-03-30 13:00:00'),
       (21, 24,
        'Officiis et debitis fuga aliquam consequatur delectus. Quam quo quae ducimus aut ducimus. Qui sit ut asperiores officiis repellat ullam.',
        '2021-03-30 13:00:00'),
       (25, 22,
        'Aut itaque officia beatae nesciunt laborum odio. Quasi nihil officiis quo quam. Delectus earum cupiditate ut nulla molestias praesentium officia.',
        '2021-03-30 13:00:00'),
       (22, 25,
        'Aut eos tenetur numquam quos itaque et. Qui voluptatem nostrum architecto laborum et omnis. Temporibus qui maiores cum et a. Voluptatum et non in culpa ipsa mollitia quia.',
        '2021-03-30 13:00:00'),
       (2, 27,
        'Rerum et voluptatem earum ea. Dolores et sequi repellendus in vel quis dolorem.\nPlaceat rerum voluptatibus praesentium omnis est. Perferendis aliquid fuga eum odit dolores soluta.',
        '2021-03-30 13:00:00'),
       (28, 21,
        'Exercitationem corporis dolorum sit accusantium molestiae dolorem iste. Distinctio ut nihil architecto voluptatibus. Aut qui et fugit voluptate. Beatae dolor expedita quaerat.',
        '2021-03-30 13:00:00'),
       (29, 9,
        'Dolorum hic sed ad deserunt optio odio minus. Quod sed explicabo dignissimos quidem consequatur accusamus minus.',
        '2021-03-30 13:00:00'),
       (30, 3, 'Illo odio ipsam atque labore nemo. Totam consequatur non nihil. Eum officia exercitationem sunt est.',
        '2021-03-30 13:00:00');
-- 30

-- наполнение teachers_practicals + сообщения
-- (почему-то без ошибок заполняет только по одной строке)
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (36, 16, 1, 4);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (36, 1, 2, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (37, 9, 4, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (37, 24, 5, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (37, 14, 6, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (38, 25, 8, 3);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (38, 5, 9, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (39, 12, 13, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (40, 3, 14, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (40, 23, 16, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (40, 3, 18, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (45, 1, 33, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (45, 1, 35, 4);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (48, 4, 42, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (48, 7, 42, 4);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (48, 14, 42, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (48, 10, 44, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (37, 1, 57, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (38, 25, 60, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (42, 3, 74, 3);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (42, 25, 74, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (46, 1, 86, 4);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (46, 4, 87, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (46, 7, 87, 4);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (46, 5, 88, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (46, 10, 88, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (46, 1, 89, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (49, 4, 98, 5);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (49, 7, 98, 4);
INSERT INTO `teachers_practicals` (teacher_id, student_id, practical_id, rating)
VALUES (49, 24, 98, 5);


