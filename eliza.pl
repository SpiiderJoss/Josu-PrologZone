
arnold:- writeln('Hola , mi nombre es  Arnold tu chatbot del gym,
    tengo conocimientos en Cancer de prostata, en que puedo ayudarte?...,
    usar solo minúsculas sin . al final:'),
    readln(Input),
    arnold(Input),!.
arnold(Input):- Input == ['Adios'],
    writeln('Adios. espero poder verte ayudado.'), !.
arnold(Input):- Input == ['Adios', '.'],
    writeln('Adios. espero poder verte ayudado.'), !.
arnold(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    % si he llegado aquí es que he
    % hallado el template correcto:
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    arnold(Input1), !.

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a 
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% template saber que conoce
template([conoces, sobre,el, s(_), _], [flagConoce], [3]).

% pregunta algo que es Arnold
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([tengo, un, problema, con, s(_), y, s(_), '.'], ['Tienes', que, lidiar, con, 0, y, 1, de, una, manera, madura, '.'], [4, 6]).
template([tengo, s(_),  _], [puedo, recomendarte, un, libro, sobre, ese, tema], []).
template([por, favor, s(_), _], ['No', puedo, ayudarte, ',', solo, soy, una, maquina], []).
template([dime, un, s(_), _], ['No', puedo, ',', no, soy, bueno, en, eso], []).
template([cual, es, el , mejor, chocolate, del, mundo],['El', mejor, chocolate, del, mundo, es, el , que,te,guste,a,ti], []).

% preguntas gym
template([dime,una,rutina,de,entrenamiento,para,el,gym] ,['Si', pero, dime, enfocado, en, que, ?], []).
template([dime, una, rutina, de, entrenamiento, para, ganar, s(_)],['Claro', aqui, tienes, una, rutina, de, entrenamiento, recomendada, :, rutina(_)], [7]).


% preguntas sobre el gym
template([me, puedes, recomendar, una, rutina, de, pierna, para, ganar,fuerza], 
         ['Claro', aqui ,tienes,una,rutina,para,ganar,fuerza,de,pierna,:,'Sentadillas:', 4, series, x, '6-8', repeticiones,'Prensa', de, 'piernas:', 3, series, x, '8-10', repeticiones,'Peso', 'muerto:', 4, series, x, '6-8', repeticiones,'Curl', 'femoral:', 3, series, x, '10-12', repeticiones], []).

template([me, puedes, recomendar, una, rutina, de, espalda, para, ganar,fuerza], 
         ['Claro aqui tienes una rutina para ganar fuerza de espalda:  Extensiones de espalda: 3 series x 10-12 repeticiones, Pull-ups (dominadas): 4 series hasta el fallo, Pullover con mancuerna: 3 series x 10-12 repeticiones'], []).

template([me, puedes, recomendar, una, rutina, de, pecho, para, ganar,fuerza], 
         ['Claro, aqui  tienes una rutina para ganar fuerza de pecho: 
          Press de banca: 4 series x 6-8 repeticiones,
          Fondos: 3 series hasta el fallo
          Press banca inclinado: 4 series x 6.8 repeticiones'], []).

template([me, puedes, recomendar, una, rutina, de, hombro, para, ganar,fuerza], 
         ['Claro, aqui  tienes una rutina para ganar fuerza de hombro: 
         Press militar: 3 series x 8-10 repeticiones, 
         Elevaciones laterales: 3 series x 10-12 repeticiones 
         Elevaciones frontales: 3 series x 10-12 repeticiones'], []).

template([me, puedes, recomendar, una, rutina, de, brazos, para, ganar,fuerza], 
         ['Claro, aqui  tienes una rutina para ganar fuerza de brazos: 
         Curl con barra: 4 series x 8-10 repeticiones, 
         Curl martillo: 3 series x 10-12 repeticiones, 
         Fondos en paralelas: 3 series x 10-12 repeticiones, 
         Tríceps en polea alta: 3 series x 10-12 repeticiones,
         Tríceps en polea con cuerda: 3 series x 10-12 repeticiones'], []).

template([que,consejos,me,puedes,dar,para,el,gym], 
         ['1.- Realiza calentamiento antes de cada sesión.
            2.- Incrementa gradualmente el peso a medida que te vuelves más fuerte.
            3.- Descansa entre 2-3 minutos entre las series de ejercicios principales.
            4.- Realiza ejercicios compuestos para trabajar varios músculos a la vez.
            5.- Mantén una buena forma técnica en todo momento.
            6.- Escucha a tu cuerpo y ajusta la intensidad según sea necesario.
            7.- Asegúrate de incluir días de descanso en tu semana.'], []).

% Template sobre la etapa de definición en el gym
template([que, es, la, etapa, de, definicion], 
    ['La etapa de definición en el gimnasio se refiere a un período enfocado en reducir el porcentaje de grasa corporal', 
     'para resaltar y definir los músculos. Es comunmente seguida después de una fase de aumento de masa muscular.', 
     'Durante esta fase, el objetivo principal es perder grasa mientras se mantiene la masa muscular ganada.'], []).

% Template sobre consejos para la etapa de definición
template([consejos, para, la, etapa, de, definicion], 
    ['Algunos consejos para la etapa de definicion incluyen:', 
     '- Manten una dieta balanceada y controla tu ingesta calorica.', 
     '- Prioriza las proteínas para preservar la masa muscular.', 
     '- Realiza entrenamiento cardiovascular para quemar calorias adicionales.', 
     '- Incorpora ejercicios de resistencia para mantener la fuerza muscular.', 
     '- Bebe suficiente agua para mantener la hidratacion.'], []).

% Template sobre la importancia de la paciencia en la etapa de definición
template([importancia, de, la, paciencia, en, definicion], 
    ['La paciencia es clave durante la etapa de definicion.', 
     'La perdida de grasa lleva tiempo y es importante realizar cambios sostenibles en tu estilo de vida.', 
     'No te desanimes por resultados inmediatos y enfocate en la consistencia a largo plazo.'], []).

% Template sobre la etapa de volumen en el gym
template([que, es, la, etapa, de, volumen], 
    ['La etapa de volumen en el gimnasio es un período dedicado a ganar masa muscular y fuerza.', 
     'Durante esta fase, el objetivo principal es consumir un excedente calórico para favorecer el crecimiento muscular.', 
     'Se caracteriza por un entrenamiento intenso con pesas y una ingesta calórica controlada.'], []).

% Template sobre consejos para la etapa de volumen
template([consejos, para, la, etapa, de, volumen], 
    ['Algunos consejos para la etapa de volumen incluyen:', 
     '- Mantén una ingesta calórica suficiente para promover el crecimiento muscular.', 
     '- Prioriza las proteínas para facilitar la reparación y el crecimiento muscular.', 
     '- Realiza entrenamiento de fuerza con énfasis en levantamientos compuestos.', 
     '- Descansa lo suficiente para permitir la recuperación y el crecimiento muscular.', 
     '- Considera la utilización de suplementos como proteínas y carbohidratos.'], []).

% Template sobre la importancia de la consistencia en la etapa de volumen
template([importancia, de, la, consistencia, en, volumen], 
    ['La consistencia es clave durante la etapa de volumen.', 
     'Es importante mantenerse enfocado en tus objetivos a largo plazo y seguir con la rutina de entrenamiento y la dieta planificada.', 
     'Los resultados en la fase de volumen se acumulan con el tiempo y la dedicación.'], []).

% Template sobre la mensualidad promedio de gimnasios en México
template([costo, de, mensualidad, de, gimnasio], 
    ['El costo de mensualidad de gimnasios en México puede variar ampliamente dependiendo de la ubicación, el tipo de gimnasio y los servicios ofrecidos.',
     'En promedio, las mensualidades pueden oscilar entre 300 y 400 pesos mexicanos. Se recomienda contactar directamente con los gimnasios locales para obtener información específica.'], []).

% Template sobre factores que afectan el costo de mensualidades en gimnasios
template([factores, que, afectan, costo, de, mensualidad, de, gimnasio], 
    ['Varios factores pueden afectar el costo de las mensualidades en gimnasios de México:', 
     '- La ubicación geográfica: Los gimnasios en ciudades grandes tienden a ser más caros.', 
     '- Servicios ofrecidos: Gimnasios con instalaciones de lujo o clases especializadas pueden tener tarifas más altas.', 
     '- Duración del contrato: Algunos gimnasios ofrecen descuentos por contratos a largo plazo.', 
     '- Promociones y ofertas: Los gimnasios a veces tienen promociones especiales o descuentos temporales.'], []).

% Template sobre opciones de membresía y costos adicionales
template([opciones, de, membresia, y, costos, adicionales, en, gimnasio], 
    ['Los gimnasios en México suelen ofrecer diferentes opciones de membresía y costos adicionales:', 
     '- Membresía mensual estándar: Incluye acceso básico al gimnasio y sus instalaciones.', 
     '- Membresía premium: Puede incluir acceso a clases especiales, entrenadores personales, y más.', 
     '- Costos adicionales: Algunos gimnasios pueden tener tarifas adicionales, como inscripción, mantenimiento o servicios específicos.'], []).

% Template sobre qué son los suplementos alimenticios
template([que, son, los, suplementos, alimenticios], 
    ['Los suplementos alimenticios son productos diseñados para complementar la dieta y proporcionar nutrientes adicionales.', 
     'Pueden incluir vitaminas, minerales, aminoácidos, ácidos grasos esenciales, hierbas y otros ingredientes.', 
     'Están destinados a llenar posibles deficiencias nutricionales o apoyar objetivos específicos como el aumento de masa muscular o la pérdida de peso.'], []).

% Template sobre los beneficios de los suplementos alimenticios
template([beneficios, de, suplementos, alimenticios], 
    ['Los suplementos alimenticios pueden ofrecer varios beneficios:', 
     '- Cubrir deficiencias nutricionales: Ayudan a garantizar que se obtengan todos los nutrientes esenciales.', 
     '- Apoyo para objetivos específicos: Algunos suplementos son formulados para ayudar en metas como el desarrollo muscular o la recuperación.', 
     '- Facilidad y conveniencia: Proporcionan una manera práctica de obtener nutrientes adicionales sin depender completamente de la comida.', 
     '- Mejora del rendimiento: Algunos suplementos están diseñados para mejorar el rendimiento atlético o cognitivo.'], []).

% Template sobre cómo incorporar suplementos en la dieta
template([como, incorporar, suplementos, en, la, dieta], 
    ['Incorporar suplementos en la dieta puede hacerse de varias maneras:', 
     '- Consulta con un profesional: Antes de tomar cualquier suplemento, es recomendable consultar con un profesional de la salud o un nutricionista.', 
     '- Identifica deficiencias: Si tienes deficiencias nutricionales, un profesional puede recomendar suplementos específicos para cubrirlas.', 
     '- Integra gradualmente: Introduce los suplementos gradualmente y observa cómo afectan tu cuerpo y tus metas.', 
     '- Sigue una dosificación adecuada: Sigue las recomendaciones de dosificación para evitar efectos secundarios negativos.'], []).

% Template sobre qué son las proteínas en polvo
template([que, son, las, proteinas, en, polvo], 
    ['Las proteínas en polvo son suplementos alimenticios que proporcionan una fuente concentrada de proteínas.', 
     'Suelen derivarse de fuentes como suero de leche, caseína, soja, guisante o arroz.', 
     'Son populares entre aquellos que buscan aumentar la ingesta proteica para apoyar el crecimiento muscular y la recuperación.'], []).

% Template sobre los beneficios de las proteínas en polvo
template([beneficios, de, proteinas, en, polvo], 
    ['Las proteínas en polvo ofrecen varios beneficios:', 
     '- Aumento de la ingesta proteica: Son una forma conveniente de alcanzar los objetivos diarios de proteínas.', 
     '- Recuperación muscular: Ayudan en la reparación y el crecimiento muscular después del ejercicio.', 
     '- Control del peso: Pueden ser útiles en planes de pérdida de peso al proporcionar saciedad y mantener la masa muscular.', 
     '- Versatilidad: Pueden ser mezcladas con líquidos, agregadas a batidos o utilizadas en recetas.'], []).

% Template sobre cómo incorporar proteínas en polvo en la dieta
template([como, incorporar, proteinas, en, polvo, en, la, dieta], 
    ['Incorporar proteínas en polvo en la dieta se puede hacer de varias maneras:', 
     '- Batidos: Mezcla proteínas en polvo con agua, leche o bebidas vegetales para hacer batidos.', 
     '- Yogur o avena: Agrega proteínas en polvo a yogur, avena o postres para aumentar la ingesta proteica.', 
     '- Recetas: Integra proteínas en polvo en recetas de panqueques, muffins u otros platillos.', 
     '- Post-entrenamiento: Consume proteínas en polvo después del entrenamiento para apoyar la recuperación muscular.'], []).

% Template sobre qué es la creatina
template([que, es, la, creatina], 
    ['La creatina es un compuesto natural que se encuentra en pequeñas cantidades en alimentos como la carne y el pescado.', 
     'Se ha demostrado que es segura y efectiva como suplemento dietético.', 
     'La creatina es conocida por mejorar el rendimiento físico y aumentar la masa muscular.'], []).

% Template sobre los beneficios de la creatina
template([beneficios, de, la, creatina], 
    ['La creatina ofrece varios beneficios en el ámbito del rendimiento y la salud:', 
     '- Mayor fuerza y potencia: Mejora la capacidad de realizar ejercicios de alta intensidad.', 
     '- Aumento de la masa muscular: Ayuda a retener agua en las células musculares, lo que puede aumentar el tamaño muscular.', 
     '- Recuperación muscular: Contribuye a una recuperación más rápida después del ejercicio.', 
     '- Mejora del rendimiento cognitivo: Algunas investigaciones sugieren beneficios para la función cerebral.'], []).

% Template sobre cómo tomar creatina
template([como, tomar, creatina], 
    ['La creatina se puede tomar de diversas formas y dosis:', 
     '- Fase de carga: Algunas personas optan por una fase de carga tomando dosis más altas durante los primeros días.', 
     '- Mantenimiento: Después de la fase de carga, se toma una dosis más baja para mantener los niveles de creatina.', 
     '- Mezcla con líquidos: Puede mezclarse con agua, jugo o batidos de proteínas.', 
     '- Timing: Puede tomarse antes o después del entrenamiento según preferencias personales.'], []).

% Template sobre consideraciones y efectos secundarios de la creatina
template([consideraciones, y, efectos, secundarios, de, la, creatina], 
    ['Aunque la creatina es generalmente segura, es importante tener en cuenta algunas consideraciones:', 
     '- Hidratación: Aumenta la hidratación ya que puede causar retención de agua en las células musculares.', 
     '- Consulta médica: Consulta con un profesional de la salud antes de tomar creatina, especialmente si tienes condiciones médicas preexistentes.', 
     '- Dosis adecuada: Sigue las recomendaciones de dosificación para evitar efectos secundarios.', 
     '- Ciclos de descanso: Algunas personas optan por hacer ciclos de descanso para reducir la dependencia del suplemento.'], []).

% Template sobre qué son los suplementos pre-entrenamiento
template([que, son, los, suplementos, preentrenamiento], 
    ['Los suplementos pre-entrenamiento son productos diseñados para ser consumidos antes del ejercicio físico con el objetivo de mejorar el rendimiento.', 
     'Suelen contener ingredientes como cafeína, aminoácidos, beta-alanina y otros compuestos que pueden proporcionar energía y mejorar la resistencia.'], []).

% Template sobre ingredientes comunes en suplementos pre-entrenamiento
template([cuales,son, los, ingredientes, comunes, en, los,pre,entreno], 
    ['Los suplementos pre-entrenamiento pueden incluir varios ingredientes comunes:', 
     '- Cafeína: Estimula el sistema nervioso central y mejora la alerta y la energía.', 
     '- Aminoácidos: Ayudan en la síntesis de proteínas y pueden mejorar la resistencia.', 
     '- Beta-alanina: Contribuye a reducir la fatiga muscular durante el ejercicio intenso.', 
     '- Oxido nítrico: Mejora el flujo sanguíneo y la entrega de oxígeno a los músculos.'], []).

% Template sobre cómo utilizar los suplementos pre-entrenamiento de manera efectiva
template([como, utilizar, un,pre,entreno], 
    ['Para utilizar de manera efectiva los suplementos pre-entrenamiento:', 
     '- Lee las indicaciones: Sigue las recomendaciones de dosificación y uso del fabricante.', 
     '- Ajusta según tolerancia: Algunas personas pueden ser más sensibles a ciertos ingredientes, ajusta la dosis según tu tolerancia.', 
     '- Timing: Consume el suplemento aproximadamente 30-60 minutos antes del entrenamiento para permitir la absorción.', 
     '- Evita excesos: No combines múltiples fuentes de estimulantes y evita el consumo excesivo para prevenir efectos secundarios.'], []).

% Template sobre consideraciones antes de tomar suplementos pre-entrenamiento
template([consideraciones, antes, de, tomar, pre,entreno], 
    ['Antes de tomar suplementos pre-entrenamiento, ten en cuenta algunas consideraciones:', 
     '- Consulta médica: Si tienes condiciones médicas preexistentes, consulta con un profesional de la salud antes de tomarlos.', 
     '- Sensibilidad a estimulantes: Si eres sensible a la cafeína u otros estimulantes, elige productos con baja cantidad o sin ellos.', 
     '- Descanso y ciclos: Considera periodos de descanso para evitar la dependencia y mantener la sensibilidad a los ingredientes.'], []).

% Template sobre el kit básico del gimnasio
template([kit, basico, del, gym], 
    ['El kit básico del gimnasio incluye varios elementos esenciales para un programa de entrenamiento efectivo:', 
     '- Ropa cómoda y calzado adecuado: Garantiza comodidad y seguridad durante el ejercicio.', 
     '- Botella de agua: Mantente hidratado durante el entrenamiento.', 
     '- Toalla: Útil para secarte y mantener la higiene en el gimnasio.', 
     '- Guantes de levantamiento de pesas: Protegen las manos durante el levantamiento de pesas.', 
     '- Auriculares: Para disfrutar de música o podcasts que te motiven.', 
     '- Agenda o aplicación de seguimiento: Registra tus entrenamientos y progreso.'], []).

% Template sobre la importancia de la ropa y calzado adecuado
template([importancia, de, ropa, y, calzado, adecuado], 
    ['Usar ropa cómoda y calzado adecuado es crucial para el éxito en el gimnasio:', 
     '- Comodidad: Ropa adecuada permite movimientos libres y cómodos durante el ejercicio.', 
     '- Seguridad: Calzado adecuado proporciona soporte y reduce el riesgo de lesiones.', 
     '- Adecuación al tipo de ejercicio: La elección de la ropa debe adaptarse al tipo de ejercicio que realices.'], []).

% Template sobre cómo elegir guantes de levantamiento de pesas
template([como, elegir, guantes, de, levantamiento, de, pesas], 
    ['Al elegir guantes de levantamiento de pesas, considera los siguientes factores:', 
     '- Ajuste: Deben ajustarse cómodamente sin ser demasiado ajustados o sueltos.', 
     '- Material: Opta por materiales duraderos y transpirables.', 
     '- Protección: Deben proporcionar protección para las manos durante el levantamiento de pesas.'], []).

% Template sobre la importancia de la hidratación
template([importancia, de, la, hidratacion], 
    ['Mantenerse hidratado es esencial para un rendimiento óptimo en el gimnasio:', 
     '- Rendimiento: La deshidratación puede afectar negativamente el rendimiento y la resistencia.', 
     '- Recuperación: La hidratación adecuada facilita la recuperación muscular después del ejercicio.', 
     '- Salud general: Beber suficiente agua es crucial para la salud en general.'], []).





template(_, ['Por favor', explicate, un, poco, mas, no, te, entiendo,'.'], []). 

% ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
% Template que proporciona información general sobre el cáncer de próstata
template([que, es, el, cancer, de, prostata], 
         ['El cáncer de próstata es un tipo de cáncer que se desarrolla en la próstata, una glándula del sistema reproductor masculino.', 
          'La próstata es responsable de producir parte del líquido seminal que protege y nutre a los espermatozoides.', 
          'El cáncer de próstata es uno de los cánceres más comunes en los hombres.'], []).

% Template que aborda la prevalencia del cáncer de próstata
template([cuantas, personas, tienen, cancer, de, prostata], 
         ['El cáncer de próstata es bastante común y afecta a un gran número de hombres en todo el mundo.', 
          'La incidencia aumenta con la edad, y se estima que la mayoría de los casos se diagnostican en hombres mayores de 65 años.'], []).

% Template sobre los factores de riesgo del cáncer de próstata
template([cuales, son, los, factores, de, riesgo, del, cancer, de, prostata], 
         ['Algunos de los factores de riesgo para el cáncer de próstata incluyen:', 
          '- Edad avanzada.', 
          '- Antecedentes familiares de cáncer de próstata.', 
          '- Raza (los hombres afroamericanos tienen un mayor riesgo).', 
          '- Dieta rica en grasas.'], []).

% Template que destaca la importancia de los exámenes de detección
template([por, que, es, importante, hacer, examenes, de, deteccion, del, cancer, de, prostata], 
         ['La detección temprana del cáncer de próstata es crucial para un tratamiento exitoso.', 
          'Los exámenes de detección, como el análisis de antígeno prostático específico (PSA) y el examen rectal digital (ERD),', 
          'pueden ayudar a identificar la enfermedad en sus etapas iniciales cuando es más tratable.'], []).

% Template que aborda las opciones de tratamiento para el cáncer de próstata
template([cuales, son, las, opciones, de, tratamiento, del, cancer, de, prostata], 
         ['Las opciones de tratamiento para el cáncer de próstata pueden incluir:', 
          '- Cirugía para extirpar la próstata.', 
          '- Radioterapia para destruir las células cancerosas.', 
          '- Terapia hormonal para reducir los niveles de hormonas que alimentan el cáncer.', 
          '- Vigilancia activa en casos de cáncer de bajo riesgo.', 
          'El tratamiento específico dependerá de la etapa y la agresividad del cáncer.'], []).

% Template que ofrece apoyo emocional a los pacientes
template([como, lidiar, emocionalmente, con, el, cancer, de, prostata], 
         ['Recibir un diagnóstico de cáncer de próstata puede ser emocionalmente desafiante.', 
          'Es importante buscar apoyo emocional de amigos, familiares o profesionales de la salud mental.', 
          'La participación en grupos de apoyo también puede ser beneficioso para compartir experiencias con otros afectados.'], []).

% Template que resalta la importancia del estilo de vida saludable
template([que, puedo, hacer, para, reducir, el, riesgo, de, cancer, de, prostata], 
         ['Adoptar un estilo de vida saludable puede ayudar a reducir el riesgo de desarrollar cáncer de próstata.', 
          'Algunas recomendaciones incluyen:', 
          '- Mantener una dieta equilibrada y baja en grasas.', 
          '- Mantener un peso corporal saludable.', 
          '- Hacer ejercicio regularmente.', 
          '- Evitar el consumo excesivo de alcohol.', 
          '- Dejar de fumar si es un hábito.'], []).


% Lo que le gusta a arnold : flagLike
arnoldLikes(X, R):- likes(X), R = ['Si', me, gustan, los, X].
arnoldLikes(X, R):- likes(X), R = ['Si', me, gustan, las, X].
arnoldLikes(X, R):- \+likes(X), R = ['No', no, me, gustan, los, X].
arnoldLikes(X, R):- \+likes(X), R = ['No', no, me, gustan, las, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
likes(carros).
likes(chochos).


% lo que hace arnold: flagDo
arnoldHace(X, R):- hace(X), R = ['Si', yo, X, y, me, encanta].
arnoldDoes(X, R):- \+hace(X), R = ['No', yo, no, hago, X ,'.', es, demasiado, dificil, para, mi].
hace(estudia).
hace(cocina).
hace(trabaja).
hace(lee).
hace(juega).
hace(corre).
hace(pinta).
hace(escuchaMusica).
hace(vaAlGym).
hace(dieta).
hace(juegaVideoJuegos).


% lo que es arnold: flagIs
arnoldEs(X, R):- es0(X), R = ['Si', yo, soy, X].
arnoldEs(X, R):- \+es0(X), R = ['No', yo, no, soy, X].
es0(tonto).
es0(raro).
es0(bueno).
es0(fino).
es0(feliz).
es0(redundante).
es0(guapo).
es0(feo).
es0(inteligente).
es0(divertido).
es0(paciente).
es0(activo).
es0(perezoso).
es0(amable).
es0(serio).
es0(extrovertido).
es0(introvertido).
es0(optimista).
es0(pesimista).

% arnold conoce cancer de prostata: flagConoce
arnoldConoce(X, R):- conoce(X), R = ['Si', conozco, sobre, X].
arnoldConoce(X, R):- conoce(X), R = ['Si', conozco, sobre,el, X].
arnoldConoce(X, R):- \+conoce(X), R = ['No', no, conozco,sobre, X].
arnoldConoce(X, R):- \+conoce(X), R = ['No', no, conozco,sobre,el, X].
conoce(cancer).
conoce(gym).
conoce(rutinas).
conoce(ejercicios).
conoce(alimentacion).



match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
    atom(S), % si I es un s(X) devuelve falso
    S == I,
    match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
    \+atom(S),
    match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% arnold likes:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagLike,
    arnoldLikes(Atom, R).

% Arnold does:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagDo,
    arnoldDoes(Atom, R).

% Arnold is:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagIs,
        arnoldIs(Atom, R).

% Arnold Conoce:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagConoce,
    arnoldConoce(Atom, R).

replace0([I|Index], Input, N, Resp, R):-
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R),!.
