
arnold:- writeln('Hola , mi nombre es  Arnold tu chatbot del gym,
    tengo conocimientos en Cancer de prostata, en que puedo ayudarte?...,
    usar solo minusculas sin . al final y sin acentos...'),
    readln(Input),
    arnold(Input),!.
arnold(Input):- Input == ['adios'],
    writeln('Adios. espero haber sido de ayuda.'), !.
    arnold(Input):- Input == ['Adios'],
    writeln('Adios. espero haber sido de ayuda.'), !.
    arnold(Input):- Input == ['Adios'],
    writeln('Adios. espero haber sido de ayuda.'), !.
arnold(Input):- Input == ['Adios', '.'],
    writeln('Adios. espero haber sido de ayuda.'), !.
arnold(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    % si he llegado aquí es que he
    % hallado el template correcto:
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    arnold(Input1), !.

template([alumno], ['Josue Montalvan Zavala'],[]).

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([quien,me,va,a,partir,la,madre], ['El profe'], []).
template([porque,el,profe,tiene,tanta,gente,en,el,cubiculo], ['NO TENGO IDEA! NO SE DE DONDE SALIO TANTA GENTE'], []).
template([por,que,el,profe,tiene,tanta,gente,en,su,cubiculo], ['NO TENGO IDEA! NO SE DE DONDE SALIO TANTA GENTE'], []).

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
template([por, favor, s(_), _], ['No', puedo, ayudarte, ',', solo, soy, una, maquina], []).
template([dime, un, s(_), _], ['No', puedo, ',', no, soy, bueno, en, eso], []).
template([cual, es, el , mejor, chocolate, del, mundo],['El', mejor, chocolate, del, mundo, es, el , que,te,guste,a,ti], []).

% templates random
template([quien,es,el,profe,de,prolog],
        ['El profe de la materia prolog se llama Jesus Eduardo Alcaraz, esperemos te ponga 100, por que te la rifaste'],[]).

% preguntas gym
template([dime,una,rutina,de,entrenamiento,para,el,gym] ,['Si, claro pero enfocado en que, fuerza o resistencia'], []).

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

% Rutina de resistencia
template([me, puedes, recomendar, una, rutina, de, resistencia,de,cuerpo,completo], 
    ['Rutina de Resistencia:',
     'Circuito de Cuerpo Completo:',
     '1. Saltos de Tijera: 3 series x 1 minuto de trabajo, 30 segundos de descanso',
     '2. Burpees: 3 series x 1 minuto de trabajo, 30 segundos de descanso',
     '3. Mountain Climbers: 3 series x 1 minuto de trabajo, 30 segundos de descanso',
     'Cardio de Alta Intensidad:',
     'Correr o Saltar la Cuerda: 20 minutos a ritmo constante',
     'Entrenamiento de Fuerza Funcional:',
     '1. Flexiones: 3 series x 15-20 repeticiones',
     '2. Sentadillas Corporales: 3 series x 20 repeticiones',
     '3. Plancha Frontal: 3 series x 1 minuto de trabajo, 30 segundos de descanso',
     'Recuerda ajustar la intensidad según tu nivel y progresar gradualmente. ¡Buena suerte!'], []).

% Rutina de pierna para ganar resistencia
template([rutina,de, pierna,para,ganar, resistencia], 
    ['Rutina de Pierna para Ganar Resistencia:',
     '1. Sentadillas: 3 series x 15-20 repeticiones',
     '2. Zancadas: 3 series x 20 repeticiones (10 cada pierna)',
     '3. Salto de Caja: 3 series x 15 repeticiones',
     '4. Elevaciones de Gemelos: 3 series x 25 repeticiones',
     '5. Saltos Laterales: 3 series x 15 repeticiones (7 cada lado)'], []).

% Rutina de espalda para ganar resistencia
template([rutina,de, espalda,para,ganar, resistencia], 
    ['Rutina de Espalda para Ganar Resistencia:',
     '1. Pull-ups (Dominadas): 4 series x 12-15 repeticiones',
     '2. Remo con Barra: 3 series x 15-20 repeticiones',
     '3. Hiperextensiones: 3 series x 20 repeticiones',
     '4. Pull-over con Mancuerna: 3 series x 15-20 repeticiones'], []).

% Rutina de pecho para ganar resistencia
template([rutina,de, pecho,para,ganar, resistencia], 
    ['Rutina de Pecho para Ganar Resistencia:',
     '1. Flexiones (Push-ups): 4 series x 20-25 repeticiones',
     '2. Press de Pecho con Mancuernas: 3 series x 15-20 repeticiones',
     '3. Fondos en Paralelas: 3 series x 20 repeticiones',
     '4. Pullover con Barra: 3 series x 15-20 repeticiones'], []).

% Rutina de hombro para ganar resistencia
template([rutina,de, hombro,pra,ganar, resistencia], 
    ['Rutina de Hombro para Ganar Resistencia:',
     '1. Press Militar: 3 series x 15-20 repeticiones',
     '2. Elevaciones Laterales: 3 series x 20-25 repeticiones',
     '3. Elevaciones Frontales: 3 series x 15-20 repeticiones',
     '4. Rotaciones con Mancuernas: 3 series x 20 repeticiones (10 cada lado)'], []).

% Rutina de brazos para ganar resistencia
template([rutina,de, brazos,para,ganar, resistencia], 
    ['Rutina de Brazos para Ganar Resistencia:',
     '1. Flexiones Diamante: 3 series x 20-25 repeticiones',
     '2. Curl con Barra: 3 series x 15-20 repeticiones',
     '3. Fondos Tríceps en Silla: 3 series x 20 repeticiones',
     '4. Curl Martillo: 3 series x 15-20 repeticiones',
     '5. Fondos en Paralelas: 3 series x 20 repeticiones'], []).

template([que,consejos,me,puedes,dar,para,el,gym], 
         ['1.- Realiza calentamiento antes de cada sesion.
            2.- Incrementa gradualmente el peso a medida que te vuelves mas fuerte.
            3.- Descansa entre 2-3 minutos entre las series de ejercicios principales.
            4.- Realiza ejercicios compuestos para trabajar varios musculos a la vez.
            5.- Manten una buena forma tecnica en todo momento.
            6.- Escucha a tu cuerpo y ajusta la intensidad segun sea necesario.
            7.- Asegurate de incluir dias de descanso en tu semana.'], []).

% Template sobre la etapa de definición en el gym
template([que, es, la, etapa, de, definicion], 
    ['La etapa de definicion en el gimnasio se refiere a un periodo enfocado en reducir el porcentaje de grasa corporal', 
     'para resaltar y definir los musculos. Es comunmente seguida despues de una fase de aumento de masa muscular.', 
     'Durante esta fase, el objetivo principal es perder grasa mientras se mantiene la masa muscular ganada.'], []).

% Template sobre consejos para la etapa de definición
template([consejos, para, la, etapa, de, definicion], 
    ['Algunos consejos para la etapa de definicion incluyen:', 
     '- Manten una dieta balanceada y controla tu ingesta calorica.', 
     '- Prioriza las proteinas para preservar la masa muscular.', 
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
     'Durante esta fase, el objetivo principal es consumir un excedente calorico para favorecer el crecimiento muscular.', 
     'Se caracteriza por un entrenamiento intenso con pesas y una ingesta calorica controlada.'], []).

% Template sobre consejos para la etapa de volumen
template([consejos, para, la, etapa, de, volumen], 
    ['Algunos consejos para la etapa de volumen incluyen:', 
     '- Manten una ingesta calorica suficiente para promover el crecimiento muscular.', 
     '- Prioriza las proteinas para facilitar la reparacion y el crecimiento muscular.', 
     '- Realiza entrenamiento de fuerza con enfasis en levantamientos compuestos.', 
     '- Descansa lo suficiente para permitir la recuperacion y el crecimiento muscular.', 
     '- Considera la utilización de suplementos como proteinas y carbohidratos.'], []).

% Template sobre la importancia de la consistencia en la etapa de volumen
template([importancia, de, la, consistencia, en, volumen], 
    ['La consistencia es clave durante la etapa de volumen.', 
     'Es importante mantenerse enfocado en tus objetivos a largo plazo y seguir con la rutina de entrenamiento y la dieta planificada.', 
     'Los resultados en la fase de volumen se acumulan con el tiempo y la dedicacion.'], []).

% Template sobre la mensualidad promedio de gimnasios en México
template([costo, de, mensualidad, de, gimnasio], 
    ['El costo de mensualidad de gimnasios en Mexico puede variar ampliamente dependiendo de la ubicación, el tipo de gimnasio y los servicios ofrecidos.',
     'En promedio, las mensualidades pueden oscilar entre 300 y 400 pesos mexicanos. Se recomienda contactar directamente con los gimnasios locales para obtener informacion especifica.'], []).

% Template sobre factores que afectan el costo de mensualidades en gimnasios
template([factores, que, afectan, costo, de, mensualidad, de, gimnasio], 
    ['Varios factores pueden afectar el costo de las mensualidades en gimnasios de Mexico:', 
     '- La ubicacion geografica: Los gimnasios en ciudades grandes tienden a ser mas caros.', 
     '- Servicios ofrecidos: Gimnasios con instalaciones de lujo o clases especializadas pueden tener tarifas mas altas.', 
     '- Duracion del contrato: Algunos gimnasios ofrecen descuentos por contratos a largo plazo.', 
     '- Promociones y ofertas: Los gimnasios a veces tienen promociones especiales o descuentos temporales.'], []).

template([opciones, de, membresia, y, costos, adicionales, en, gimnasio], 
    ['Los gimnasios en Mexico suelen ofrecer diferentes opciones de membresia y costos adicionales:', 
     '- Membresia mensual estendar: Incluye acceso basico al gimnasio y sus instalaciones.', 
     '- Membresia premium: Puede incluir acceso a clases especiales, entrenadores personales, y mas.', 
     '- Costos adicionales: Algunos gimnasios pueden tener tarifas adicionales, como inscripcion, mantenimiento o servicios especificos.'], []).

template([que, son, los, suplementos, alimenticios], 
    ['Los suplementos alimenticios son productos diseñados para complementar la dieta y proporcionar nutrientes adicionales.', 
     'Pueden incluir vitaminas, minerales, aminoacidos, acidos grasos esenciales, hierbas y otros ingredientes.', 
     'Estan destinados a llenar posibles deficiencias nutricionales o apoyar objetivos específicos como el aumento de masa muscular o la perdida de peso.'], []).

template([beneficios, de, suplementos, alimenticios], 
    ['Los suplementos alimenticios pueden ofrecer varios beneficios:', 
     '- Cubrir deficiencias nutricionales: Ayudan a garantizar que se obtengan todos los nutrientes esenciales.', 
     '- Apoyo para objetivos específicos: Algunos suplementos son formulados para ayudar en metas como el desarrollo muscular o la recuperación.', 
     '- Facilidad y conveniencia: Proporcionan una manera práctica de obtener nutrientes adicionales sin depender completamente de la comida.', 
     '- Mejora del rendimiento: Algunos suplementos estan diseñados para mejorar el rendimiento atletico o cognitivo.'], []).

template([como, incorporar, suplementos, en, la, dieta], 
    ['Incorporar suplementos en la dieta puede hacerse de varias maneras:', 
     '- Consulta con un profesional: Antes de tomar cualquier suplemento, es recomendable consultar con un profesional de la salud o un nutricionista.', 
     '- Identifica deficiencias: Si tienes deficiencias nutricionales, un profesional puede recomendar suplementos específicos para cubrirlas.', 
     '- Integra gradualmente: Introduce los suplementos gradualmente y observa cómo afectan tu cuerpo y tus metas.', 
     '- Sigue una dosificacion adecuada: Sigue las recomendaciones de dosificacion para evitar efectos secundarios negativos.'], []).

template([que, son, las, proteinas, en, polvo], 
    ['Las proteinas en polvo son suplementos alimenticios que proporcionan una fuente concentrada de proteinas.', 
     'Suelen derivarse de fuentes como suero de leche, caseina, soja, guisante o arroz.', 
     'Son populares entre aquellos que buscan aumentar la ingesta proteica para apoyar el crecimiento muscular y la recuperacion.'], []).

template([beneficios, de, proteinas, en, polvo], 
    ['Las proteinas en polvo ofrecen varios beneficios:', 
     '- Aumento de la ingesta proteica: Son una forma conveniente de alcanzar los objetivos diarios de proteinas.', 
     '- Recuperacion muscular: Ayudan en la reparacion y el crecimiento muscular despues del ejercicio.', 
     '- Control del peso: Pueden ser utiles en planes de perdida de peso al proporcionar saciedad y mantener la masa muscular.', 
     '- Versatilidad: Pueden ser mezcladas con liquidos, agregadas a batidos o utilizadas en recetas.'], []).

template([como, incorporar, proteinas, en, polvo, en, la, dieta], 
    ['Incorporar proteinas en polvo en la dieta se puede hacer de varias maneras:', 
     '- Batidos: Mezcla proteinas en polvo con agua, leche o bebidas vegetales para hacer batidos.', 
     '- Yogur o avena: Agrega proteinas en polvo a yogur, avena o postres para aumentar la ingesta proteica.', 
     '- Recetas: Integra proteinas en polvo en recetas de panqueques, muffins u otros platillos.', 
     '- Post-entrenamiento: Consume proteinas en polvo despues del entrenamiento para apoyar la recuperacion muscular.'], []).

template([que, es, la, creatina], 
    ['La creatina es un compuesto natural que se encuentra en pequeñas cantidades en alimentos como la carne y el pescado.', 
     'Se ha demostrado que es segura y efectiva como suplemento dietético.', 
     'La creatina es conocida por mejorar el rendimiento físico y aumentar la masa muscular.'], []).

template([beneficios, de, la, creatina], 
    ['La creatina ofrece varios beneficios en el ámbito del rendimiento y la salud:', 
     '- Mayor fuerza y potencia: Mejora la capacidad de realizar ejercicios de alta intensidad.', 
     '- Aumento de la masa muscular: Ayuda a retener agua en las células musculares, lo que puede aumentar el tamaño muscular.', 
     '- Recuperacion muscular: Contribuye a una recuperacion mas rapida despues del ejercicio.', 
     '- Mejora del rendimiento cognitivo: Algunas investigaciones sugieren beneficios para la funcion cerebral.'], []).

template([como, tomar, creatina], 
    ['La creatina se puede tomar de diversas formas y dosis:', 
     '- Fase de carga: Algunas personas optan por una fase de carga tomando dosis mas altas durante los primeros dias.', 
     '- Mantenimiento: Despues de la fase de carga, se toma una dosis mas baja para mantener los niveles de creatina.', 
     '- Mezcla con liquidos: Puede mezclarse con agua, jugo o batidos de proteinas.', 
     '- Timing: Puede tomarse antes o despues del entrenamiento segun preferencias personales.'], []).

template([consideraciones, y, efectos, secundarios, de, la, creatina], 
    ['Aunque la creatina es generalmente segura, es importante tener en cuenta algunas consideraciones:', 
     '- Hidratacion: Aumenta la hidratacion ya que puede causar retencion de agua en las células musculares.', 
     '- Consulta medica: Consulta con un profesional de la salud antes de tomar creatina, especialmente si tienes condiciones medicas preexistentes.', 
     '- Dosis adecuada: Sigue las recomendaciones de dosificacion para evitar efectos secundarios.', 
     '- Ciclos de descanso: Algunas personas optan por hacer ciclos de descanso para reducir la dependencia del suplemento.'], []).

template([que, son, los, suplementos, preentrenamiento], 
    ['Los suplementos pre-entrenamiento son productos diseñados para ser consumidos antes del ejercicio físico con el objetivo de mejorar el rendimiento.', 
     'Suelen contener ingredientes como cafeina, aminoacidos, beta-alanina y otros compuestos que pueden proporcionar energia y mejorar la resistencia.'], []).

template([cuales,son, los, ingredientes, comunes, en, los,pre,entreno], 
    ['Los suplementos pre-entrenamiento pueden incluir varios ingredientes comunes:', 
     '- Cafeina: Estimula el sistema nervioso central y mejora la alerta y la energia.', 
     '- Aminoacidos: Ayudan en la síntesis de proteinas y pueden mejorar la resistencia.', 
     '- Beta-alanina: Contribuye a reducir la fatiga muscular durante el ejercicio intenso.', 
     '- Oxido nitrico: Mejora el flujo sanguineo y la entrega de oxigeno a los músculos.'], []).

template([como, utilizar, un,pre,entreno], 
    ['Para utilizar de manera efectiva los suplementos pre-entrenamiento:', 
     '- Lee las indicaciones: Sigue las recomendaciones de dosificacion y uso del fabricante.', 
     '- Ajusta segun tolerancia: Algunas personas pueden ser mas sensibles a ciertos ingredientes, ajusta la dosis segun tu tolerancia.', 
     '- Timing: Consume el suplemento aproximadamente 30-60 minutos antes del entrenamiento para permitir la absorcion.', 
     '- Evita excesos: No combines multiples fuentes de estimulantes y evita el consumo excesivo para prevenir efectos secundarios.'], []).

template([consideraciones, antes, de, tomar, pre,entreno], 
    ['Antes de tomar suplementos pre-entrenamiento, ten en cuenta algunas consideraciones:', 
     '- Consulta medica: Si tienes condiciones medicas preexistentes, consulta con un profesional de la salud antes de tomarlos.', 
     '- Sensibilidad a estimulantes: Si eres sensible a la cafeina u otros estimulantes, elige productos con baja cantidad o sin ellos.', 
     '- Descanso y ciclos: Considera periodos de descanso para evitar la dependencia y mantener la sensibilidad a los ingredientes.'], []).

template([kit, basico, del, gym], 
    ['El kit basico del gimnasio incluye varios elementos esenciales para un programa de entrenamiento efectivo:', 
     '- Ropa comoda y calzado adecuado: Garantiza comodidad y seguridad durante el ejercicio.', 
     '- Botella de agua: Mantente hidratado durante el entrenamiento.', 
     '- Toalla: Util para secarte y mantener la higiene en el gimnasio.', 
     '- Guantes de levantamiento de pesas: Protegen las manos durante el levantamiento de pesas.', 
     '- Auriculares: Para disfrutar de musica o podcasts que te motiven.', 
     '- Agenda o aplicacion de seguimiento: Registra tus entrenamientos y progreso.'], []).

template([importancia, de, ropa, y, calzado, adecuado, en,el,gym], 
    ['Usar ropa comoda y calzado adecuado es crucial para el exito en el gimnasio:', 
     '- Comodidad: Ropa adecuada permite movimientos libres y comodos durante el ejercicio.', 
     '- Seguridad: Calzado adecuado proporciona soporte y reduce el riesgo de lesiones.', 
     '- Adecuacion al tipo de ejercicio: La eleccion de la ropa debe adaptarse al tipo de ejercicio que realices.'], []).

template([como, elegir, guantes, de, levantamiento, de, pesas], 
    ['Al elegir guantes de levantamiento de pesas, considera los siguientes factores:', 
     '- Ajuste: Deben ajustarse comodamente sin ser demasiado ajustados o sueltos.', 
     '- Material: Opta por materiales duraderos y transpirables.', 
     '- Proteccion: Deben proporcionar proteccion para las manos durante el levantamiento de pesas.'], []).

template([importancia, de, la, hidratacion], 
    ['Mantenerse hidratado es esencial para un rendimiento optimo en el gimnasio:', 
     '- Rendimiento: La deshidratacion puede afectar negativamente el rendimiento y la resistencia.', 
     '- Recuperacion: La hidratacion adecuada facilita la recuperacion muscular despues del ejercicio.', 
     '- Salud general: Beber suficiente agua es crucial para la salud en general.'], []).

     % Template para una dieta para ganar masa muscular
template([dame, una, dieta, para, ganar, masa, muscular], 
    ['¡Claro! Aquí tienes una dieta diseñada para ayudarte a ganar masa muscular:',
     '- Desayuno:',
     '  - 4 claras de huevo revueltas con espinacas',
     '  - Avena cocida con plátano y almendras',
     '- Snack a Media Mañana:',
     '  - Yogur griego natural con frutas y nueces',
     '- Almuerzo:',
     '  - Pechuga de pollo a la parrilla',
     '  - Quinoa o arroz integral',
     '  - Brócoli al vapor',
     '- Merienda de la Tarde:',
     '  - Batido de proteínas con leche y plátano',
     '  - Pan integral con aguacate',
     '- Cena:',
     '  - Salmón al horno',
     '  - Batata asada',
     '  - Espárragos salteados',
     '- Snack Nocturno:',
     '  - Queso cottage con piña o uvas',
     'Recuerda ajustar las porciones según tus necesidades calóricas y beber suficiente agua durante el día. Consulta con un nutricionista para personalizarla según tu situación específica. ¡Buena alimentación!'], []).

% Template para una dieta para bajar grasa
template([dame, una, dieta, para, bajar, grasa], 
    ['¡Claro! Aquí tienes una dieta diseñada para ayudarte a reducir grasa corporal:',
     '- Desayuno:',
     '  - Batido de proteínas con leche y frutas (por ejemplo, fresas o arándanos)',
     '  - Tostadas integrales con aguacate',
     '- Snack a Media Mañana:',
     '  - Yogur griego natural con almendras y un toque de miel',
     '- Almuerzo:',
     '  - Ensalada de pollo a la parrilla con verduras mixtas y aderezo de vinagreta',
     '  - Quinoa cocida',
     '- Merienda de la Tarde:',
     '  - Rodajas de pepino con hummus',
     '- Cena:',
     '  - Salmón al horno con limón y hierbas',
     '  - Espárragos asados',
     '  - Batata al horno',
     '- Snack Nocturno:',
     '  - Té verde con unas nueces',
     'Recuerda ajustar las porciones según tus necesidades calóricas y mantener la hidratación. Consulta con un nutricionista para adaptarla a tus requerimientos específicos. ¡Buena alimentación!'], []).

% Template para consejos sobre cómo ponerse fuerte
template([como, hago, para, ponerme, fuerte], 
    ['¡Claro! Aquí tienes algunos consejos para ayudarte a poner en marcha tu camino para ponerte fuerte:',
     '- Plan de Entrenamiento:',
     '  - Diseña un plan de entrenamiento que incluya ejercicios compuestos como sentadillas, press de banca y peso muerto.',
     '  - Incrementa gradualmente la carga y la intensidad para desafiar tus músculos y fomentar el crecimiento.',
     '- Nutrición:',
     '  - Consume una dieta rica en proteínas para apoyar la reparación y el crecimiento muscular.',
     '  - Incluye carbohidratos y grasas saludables para proporcionar energía durante tus entrenamientos.',
     '- Descanso y Recuperación:',
     '  - Dale a tu cuerpo tiempo para recuperarse. El descanso es crucial para el crecimiento muscular.',
     '  - Asegúrate de dormir lo suficiente para favorecer la recuperación y el rendimiento.',
     '- Hidratación:',
     '  - Mantente bien hidratado para apoyar funciones corporales óptimas, incluido el rendimiento físico.',
     '  - Bebe agua antes, durante y después de tus entrenamientos.',
     '- Consistencia:',
     '  - La consistencia es clave. Mantén un enfoque constante en tu plan de entrenamiento y nutrición.',
     'Recuerda que la progresión gradual y la paciencia son esenciales. Consulta con un entrenador personal o profesional de la salud para obtener orientación personalizada. ¡Buena suerte en tu viaje para ponerte fuerte!'], []).

% Template para responder a la pregunta sobre cuándo se ven resultados en el gimnasio
template([a, los, cuantos, meses, veo, resultados, en, el, gym], 
    ['La rapidez con la que se ven resultados en el gimnasio puede variar según diversos factores, como tu dedicación, genética y programa de entrenamiento.', 
     'Sin embargo, en términos generales, algunos cambios pueden empezar a notarse en un plazo de 2 a 3 meses si mantienes una rutina constante y una nutrición adecuada.', 
     'Es importante ser paciente y no desanimarse, ya que la transformación física lleva tiempo.', 
     'Recuerda ajustar tu programa de entrenamiento y nutrición según tus metas y necesidades específicas.'], []).

% Template para responder a la pregunta sobre cuándo se ven resultados del gimnasio
template([a, los, cuantos, meses, veo, resultados, del, gym], 
    ['La velocidad a la que se ven resultados del gimnasio puede variar según varios factores, como la consistencia en el entrenamiento, la dieta y la genética individual.', 
     'En términos generales, algunos cambios pueden comenzar a notarse en un plazo de 2 a 3 meses con un compromiso constante.', 
     'Sin embargo, la transformación física significativa a menudo lleva más tiempo, y es crucial mantener la paciencia y la motivación a lo largo del proceso.', 
     'Recuerda ajustar tu rutina de ejercicios y dieta según tus objetivos específicos y busca asesoramiento profesional si es necesario.'], []).

% Sintomas lesion gym
        template([si, tengo, dolor, de, s(_), es, sintoma, de, una,lesion, _], [flagSintomas1], [4]).
        template([si, tengo, dolor, en, s(_), es, sintoma, de, una,lesion, _], [flagSintomas1], [4]).
        template([si, tengo, dolor, en,el, s(_), es, sintoma, de, una,lesion, _], [flagSintomas1], [5]).
        template([si, tengo, dolor, en,la, s(_), es, sintoma, de, una,lesion, _], [flagSintomas1], [5]).
		template([me,duele,el, s(_),es,una,lesion, _], [flagSintomas1], [3]).
        template([me,duele,la, s(_),es,una,lesion, _], [flagSintomas1], [3]).

% lesiones binarias

        template([tengo,dolor,de, s(_), y ,s(_), es, lesion, _]  ,[flagGym], [3,5]).


% sintomas binarios

        template([tengo, s(_), y ,s(_), es, sintoma,de,cancer,de,prostata, _]  ,[flagSinDoble], [1,3]).  

% sintomas sintomasTriples

        template([tengo, s(_), s(_) ,s(_), es, sintoma,de,cancer,de,prostata, _]  ,[flagSinTriple], [1,2,3]).  

        % Soluciones - gym
        template([que, debo, de, hacer, si, tengo, una, lesion,en,la, s(_), _], [flagSoluciones1], [10]).
        template([que, debo, de, hacer, si, tengo, una, lesion,en,el, s(_), _], [flagSoluciones1], [10]).
        template([tengo, dolor, en, el , s(_)], [flagSoluciones1], [4]).
        template([tengo, dolor, en , la , s(_)], [flagSoluciones1], [4]).

% ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
% Templates cancer de prostata

% Sintomas - cancer prostata
		template([si, tengo, dolor, de , s(_), es, sintoma, de, cancer,de, prostata, _], [flagSintomas], [4]).
		template([si, tengo, s(_), es, sintoma, de, cancer,de,prostata, _], [flagSintomas], [2]).

% Soluciones - cancer de prostata
		template([que, debo, de, tomar, si, tengo, dolor, al, s(_), _], [flagSoluciones], [8]).
		template([tengo, dolor, al, s(_)], [flagSoluciones], [3]).
		template([tengo, un, s(_)], [flagSoluciones], [2]).

template([que,se,hace,para,el,mal,de,amores], 
         ['Una cheve padrino, arreglao'], []).

template([ayuda,creo,que,tengo,cancer,de,prostata], 
         ['El cancer de prostata es un tipo de cancer que se desarrolla en la prostata, una glandula del sistema reproductor masculino.',  
          'El cancer de prostata es uno de los canceres mas comunes en los hombres.',
          'Si crees que tienes cancer de prostata pues ya fuiste xD'], []).
template([que, es, el, cancer, de, prostata], 
         ['El cancer de prostata es un tipo de cancer que se desarrolla en la prostata, una glandula del sistema reproductor masculino.', 
          'La prostata es responsable de producir parte del liquido seminal que protege y nutre a los espermatozoides.', 
          'El cancer de prostata es uno de los canceres mas comunes en los hombres.'], []).

template([cuantas, personas, tienen, cancer, de, prostata], 
         ['El cancer de prostata es bastante comun y afecta a un gran numero de hombres en todo el mundo.', 
          'La incidencia aumenta con la edad, y se estima que la mayoria de los casos se diagnostican en hombres mayores de 65 anos.'], []).

template([cuales, son, los, factores, de, riesgo, del, cancer, de, prostata], 
         ['Algunos de los factores de riesgo para el cancer de prostata incluyen:', 
          '- Edad avanzada.', 
          '- Antecedentes familiares de cancer de prostata.', 
          '- Raza (los hombres afroamericanos tienen un mayor riesgo).', 
          '- Dieta rica en grasas.'], []).

template([por, que, es, importante, hacer, examenes, de, deteccion, del, cancer, de, prostata], 
         ['La deteccion temprana del cancer de prostata es crucial para un tratamiento exitoso.', 
          'Los examenes de deteccion, como el analisis de antigeno prostatico especifico (PSA) y el examen rectal digital (ERD),', 
          'pueden ayudar a identificar la enfermedad en sus etapas iniciales cuando es mas tratable.'], []).

template([cuales, son, las, opciones, de, tratamiento, del, cancer, de, prostata], 
         ['Las opciones de tratamiento para el cancer de prostata pueden incluir:', 
          '- Cirugia para extirpar la prostata.', 
          '- Radioterapia para destruir las celulas cancerosas.', 
          '- Terapia hormonal para reducir los niveles de hormonas que alimentan el cancer.', 
          '- Vigilancia activa en casos de cancer de bajo riesgo.', 
          'El tratamiento especifico dependera de la etapa y la agresividad del cancer.'], []).

template([como, lidiar, emocionalmente, con, el, cancer, de, prostata], 
         ['Recibir un diagnostico de cancer de prostata puede ser emocionalmente desafiante.', 
          'Es importante buscar apoyo emocional de amigos, familiares o profesionales de la salud mental.', 
          'La participacion en grupos de apoyo tambien puede ser beneficioso para compartir experiencias con otros afectados.'], []).

template([que, puedo, hacer, para, reducir, el, riesgo, de, cancer, de, prostata], 
         ['Adoptar un estilo de vida saludable puede ayudar a reducir el riesgo de desarrollar cancer de prostata.', 
          'Algunas recomendaciones incluyen:', 
          '- Mantener una dieta equilibrada y baja en grasas.', 
          '- Mantener un peso corporal saludable.', 
          '- Hacer ejercicio regularmente.', 
          '- Evitar el consumo excesivo de alcohol.', 
          '- Dejar de fumar si es un habito.'], []).

template([tratamientos, del, cancer, de, prostata], 
    ['El tratamiento del cancer de prostata puede variar segun el estadio de la enfermedad y la salud general del paciente.', 
     'Algunas opciones de tratamiento incluyen:', 
     '- Cirugia: La prostatectomia es la extirpacion quirurgica de la prostata.', 
     '- Radioterapia: Utiliza radiacion para destruir las celulas cancerosas.', 
     '- Terapia hormonal: Busca reducir los niveles de testosterona para frenar el crecimiento del cancer.', 
     '- Vigilancia activa: Monitorizacion cercana sin tratamiento inmediato, especialmente para casos de bajo riesgo.', 
     '- Quimioterapia: Puede ser utilizada en casos avanzados para tratar celulas cancerosas que se han diseminado.'], []).

template([efectos, secundarios, y, manejo, para,el,tratamiento,de, cancer,de, prostata], 
    ['Es importante tener en cuenta que cada opcion de tratamiento puede llevar consigo efectos secundarios. Algunas consideraciones incluyen:', 
     '- Cirugia: Puede haber efectos secundarios como incontinencia urinaria o disfuncion erectil.', 
     '- Radioterapia: Posibles efectos secundarios incluyen fatiga, irritacion de la piel y cambios en la funcion erectil.', 
     '- Terapia hormonal: Puede causar efectos secundarios como disminucion del deseo sexual y aumento de peso.', 
     '- Quimioterapia: Puede provocar nauseas, perdida de cabello y fatiga.', 
     'El manejo de estos efectos secundarios generalmente se discute y aborda con el equipo medico.'], []).

template([toma, de, decisiones, y, apoyo, emocional,sobre, el, tratamiento, cancer, prostata], 
    ['La toma de decisiones sobre el tratamiento del cancer de prostata es personal y puede ser dificil. Algunos aspectos a considerar incluyen:', 
     '- Consulta con profesionales: Habla con tu oncologo y otros profesionales de la salud para comprender las opciones y sus implicaciones.', 
     '- Apoyo emocional: Busca apoyo emocional de amigos, familiares o grupos de apoyo.', 
     '- Segunda opinion: Si es necesario, considera buscar una segunda opinion medica antes de tomar decisiones importantes.'], []).

template([datos, estadisticos, del, cancer, de, prostata], 
    ['El cancer de prostata es una enfermedad comun en los hombres, y las estadisticas proporcionan una vision de su impacto:', 
     'Segun datos recientes:', 
     '- Incidencia: El cancer de prostata es uno de los canceres mas diagnosticados en hombres a nivel mundial.', 
     '- Factores de riesgo: La incidencia aumenta con la edad, y se observa una mayor prevalencia en hombres de raza negra.', 
     '- Supervivencia: Las tasas de supervivencia son altas, especialmente cuando el cancer se detecta y trata en sus etapas tempranas.'], []).

template([importancia, de,la,deteccion, temprana, datos, estadisticos,de, cancer,de, prostata], 
    ['La deteccion temprana del cancer de prostata juega un papel clave en las tasas de supervivencia y el exito del tratamiento.', 
     'Las pruebas de deteccion, como el PSA (antigeno prostatico especifico), pueden ayudar a identificar la enfermedad en etapas tempranas cuando las opciones de tratamiento son mas efectivas.'], []).

template([variabilidad, tasas, incidencia, cancer, prostata], 
    ['Es importante destacar que las tasas de incidencia del cancer de prostata pueden variar segun la region geografica y los grupos etnicos.', 
     'Factores geneticos, ambientales y de estilo de vida pueden contribuir a estas variaciones.'], []).


template(_, ['Por favor explicate un poco mas no te entiendo,'], []).

% sintomas dobles
        sintomasDGym(X, Y, R):- sinGym(X ,Y), R = ['Con esos dos sintomas es posible que tengas una lesion'].
        
        sinGym(hombro ,espalda).
        sinGym(hombro, bicep).
        sinGym(hombro, tricep).
        sinGym(hombro, femoral).
        sinGym(hombro, gluteo).
        sinGym(hombro, cruadricep).
        sinGym(hombro, trapecio).
        sinGym(espalda, bicep).
        sinGym(espalda, tricep).
        sinGym(espalda, femoral).
        sinGym(espalda, cuadricep).
        sinGym(espalda, trapecio).
        sinGym(espalda, gluteo).
        sinGym(tricep, bicep).
        sinGym(tricep, espalda).
        sinGym(tricep, pecho).
        sinGym(tricep, hombro).
        sinGym(tricep, cuadricep).
        sinGym(pecho, hombro).
        sinGym(pecho, tricep).
        sinGym(pecho, espalda).
        sinGym(pecho, trapecio).


elizaSintomas(X, R) :-
    sintomas(X),
    (
        X = dificultad_al_orinar, R = ['Si, la dificultad al orinar es sintoma de cancer de prostata'];
        X = orina_interrumpida, R = ['Si, la orina interrumpida es sintoma de cancer de prostata'];
        X = la_orina_interrumpida, R = ['Si, la orina interrumpida es sintoma de cancer de prostata'];
        X = miccion, R = ['Si, la miccion frecuente puede ser un sintoma de la cancer de prostata.'];
        X = ardor_al_orinar, R = ['Si, el ardor al orinar es sintoma de cancer de prostata'];
        X = sangre_en_orina, R = ['Si, la sangre en la orina o semen es sintoma de cancer de prostata'];
        X = sangre_en_la_orina, R = ['Si, la sangre en la orina o semen es sintoma de cancer de prostata'];
        X = dolor_en_la_espalda, R = ['Solo si el dolor es muy frecuente, hay una posibilidad de que sea sintoma de cancer de prostata'];
        X = dolor_al_eyacular, R = ['Si, el dolor al eyacular es sintoma de cancer de prostata'];    
        R = ['Si, el dolor de', X, 'puede ser un sintoma de cancer de prostata']
    ).
		elizaSintomas(X, R):- \+sintomas(X), R = [al, parecer, el, sintoma, X , no, es, sintoma, de, cancer,de , prostata].

        sintomas(dificultad_al_orinar).
		sintomas(orina_interrumpida).
        sintomas(la_orina_interrumpida).
		sintomas(miccion).
		sintomas(ardor_al_orinar).
		sintomas(sangre_en_orina).
        sintomas(sangre_en_la_orina).
		sintomas(dolor_en_espalda).
        sintomas(dolor_en_la_espalda).
		sintomas(dolor_al_eyacular).

        % ----------------------------------------------------------

            % sintomas dobles
        sintomasDobles(X, Y, R):- sinD(X ,Y), R = ['Con esos dos sintomas es posible que tengas cancer de prostata'].

        sinD(dificultad_al_orinar, orina_interrumpida).
        sinD(dificultad_al_orinar, la_orina_interrumpida).
        sinD(dificultad_al_orinar, miccion).
        sinD(dificultad_al_orinar, ardor_al_orinar).
        sinD(dificultad_al_orinar, sangre_en_la_orina).
        sinD(dificultad_al_orinar, dolor_al_eyacular).
        sinD(orina_interrumpida, la_orina_interrumpida).
        sinD(orina_interrumpida, miccion).
        sinD(orina_interrumpida, ardor_al_orinar).
        sinD(orina_interrumpida, sangre_en_la_orina).
        sinD(orina_interrumpida, dolor_al_eyacular).
        sinD(la_orina_interrumpida, miccion).
        sinD(la_orina_interrumpida, ardor_al_orinar).
        sinD(la_orina_interrumpida, sangre_en_la_orina).
        sinD(la_orina_interrumpida, dolor_al_eyacular).
        sinD(miccion, ardor_al_orinar).
        sinD(miccion, sangre_en_la_orina).
        sinD(miccion, dolor_al_eyacular).
        sinD(ardor_al_orinar, sangre_en_la_orina).
        sinD(ardor_al_orinar, dolor_al_eyacular).
        sinD(sangre_en_la_orina, dolor_al_eyacular).
         
 % sintomas triples
        sintomasTriples(X, Y, Z, R):- sinT(X ,Y, Z), R = ['Con esos tres sintomas es posible que tengas cancer de prostata'].

        sinT(dificultad_al_orinar, orina_interrumpida, miccion).
        sinT(dificultad_al_orinar, la_orina_interrumpida, miccion).
        sinT(dificultad_al_orinar, miccion, orina_interrumpida).
        sinT(dificultad_al_orinar, ardor_al_orinar, dolor_al_eyacular).
        sinT(dificultad_al_orinar, sangre_en_la_orina, miccion).
        sinT(orina_interrumpida, miccion, la_orina_interrumpida).
        sinT(orina_interrumpida, ardor_al_orinar, dolor_al_eyacular).
        sinT(orina_interrumpida, sangre_en_la_orina, miccion).
        sinT(la_orina_interrumpida, miccion, orina_interrumpida).
        sinT(la_orina_interrumpida, ardor_al_orinar, dolor_al_eyacular).
        sinT(la_orina_interrumpida, sangre_en_la_orina, miccion).
        sinT(miccion, orina_interrumpida, la_orina_interrumpida).
        sinT(miccion, ardor_al_orinar, dolor_al_eyacular).
        sinT(miccion, sangre_en_la_orina, orina_interrumpida).
        sinT(ardor_al_orinar, dolor_al_eyacular, dificultad_al_orinar).
        sinT(ardor_al_orinar, sangre_en_la_orina, miccion).
        sinT(ardor_al_orinar, miccion, la_orina_interrumpida).
        sinT(sangre_en_la_orina, miccion, orina_interrumpida).
        sinT(sangre_en_la_orina, ardor_al_orinar, dolor_al_eyacular).
        sinT(sangre_en_la_orina, la_orina_interrumpida, miccion).
                
        % --------------------------------------------------------

        elizaSintomas1(X, R) :-
    sintomas1(X),
    (
        X = hombro, R = ['Si tienes mucho dolor en el hombro al realizar movimientos sencillos y cotidianos es muy probable que tengas una lesion.'];
        X = bicep, R = ['si tienes dolor de bicep despues de un dia de entrenamiento es normal, pero si el dolor persigue y es intolerable, es muy probable que sea una lesion.'];
        X = tricep, R = ['si tienes dolor de tricep despues de un dia de entrenamiento es normal, pero si el dolor persigue y es intolerable, es muy probable que sea una lesion.'];
        X = trapecio, R = ['el dolor en el trapecio suele estar despues de un dia de entrenamiento, pero si el dolor es demasiado y no se te quita es posible que tengas una lesion o sea demasiado estres.'];
        X = antebrazo, R = ['si tienes mucho dolor en el antebrazo es posible que tengas una lesion.'];
        X = cuadricep, R = ['el dolor en el cuadricep se debe a una buena estimulacion en el entrenamiento, pero si el dolor está despues de dias del entrenamiento y ademas es molesto es posible que tengas una lesion / desgarre , etc.'];
        X = femoral, R = ['es muy comun las lesiones de femoral, si el dolor es insoportable y te duele hasta al caminar o hacer un pequeño movimiento es sintoma de que tienes una lesion o desgarre.'];
        X = gluteo, R = ['es muy dificil que tengas una lesion de gluteo, pero si es el caso en el que te lastima mucho a mas no poder, es muy posible que sea una lesion'];
        X = pantorrilla, R = ['si tienes mucho dolor en la pantorrilla y no puedes caminar es muy probable que tengas una lesion'];
        X = espalda, R = ['si tuviste un entrenamiento pesado es probable que tengas dolor, pero si hiciste una mala tecnica y el dolor comenzo desde el entrenamiento es muy probable que sea una lesion o desgarre'];    
        R = ['Si, el dolor de', X, 'puede ser un sintoma de una lesion']
    ).
        sintomas1(hombro).
		sintomas1(bicep).
        sintomas1(tricep).
		sintomas1(trapecio).
		sintomas1(cuadricep).
		sintomas1(femoral).
        sintomas1(gluteo).
		sintomas1(pantorrilla).
        sintomas1(espalda).
    

     
% --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        % Soluciones 

		elizaSoluciones(X, R) :-
			soluciones(X),
			(
				X = orinar, R = ['Para el dolor al orinar, debes de tomar Trimetoprima y sulfametoxazol o Fosfomicina (Monurol)'];
                X = miccion, R=['Para la miccion debes tomar: Tolterodina , Oxibutinina, que puede tomarse en forma de pastilla (Ditropan XL) o usarse como parche para la piel (Oxytrol) o gel (Gelnique)'];
                X = dolor, R=['Para el dolor o ardor al orinar, dolor al eyacular o dolor de pelvis persistente, debes tomar, Trimetoprima y sulfametoxazol (Bactrim, Bactrim DS) o Fosfomicina (Monurol)'];

				R = ['Puede que tengas un dolor de', X, ' no sabemos con exactitud que sea, pero recomendamos visitar un doctor para su profundo analisis.']
			).

		elizaSoluciones(X, R):- \+soluciones(X), R = ['No tengo conocimiento al sintoma de dolor de ', X ].

		soluciones(orinar).
        soluciones(miccion).
        soluciones(dolor).

		
		elizaSoluciones1(X, R) :-
    soluciones1(X),
    (
        X = hombro, R = ['Descansa el hombro y evita ejercicios que causen dolor. Aplica hielo para reducir la inflamación. Si persiste, consulta a un fisioterapeuta.'];
        X = bicep, R = ['Permite que el biceps descanse y evita levantar objetos pesados. Aplica calor para aliviar el dolor. Si persiste, consulta a un especialista.'];
        X = tricep, R = ['Evita ejercicios intensos que involucren el triceps. Aplica hielo para reducir la inflamacion. Si persiste, consulta a un fisioterapeuta.'];
        X = trapecio, R = ['Descansa el trapecio y evita cargar peso en los hombros. Aplica calor para relajar los musculos. Si persiste, consulta a un especialista.'];
        X = antebrazo, R = ['Evita movimientos que causen dolor en el antebrazo. Aplica hielo para reducir la inflamacion. Si persiste, consulta a un fisioterapeuta.'];
        X = cuadricep, R = ['Descansa el cuadriceps y evita ejercicios intensos. Aplica hielo para reducir la inflamacion. Si persiste, consulta a un especialista.'];
        X = femoral, R = ['Descansa el musculo femoral y evita estiramientos bruscos. Aplica calor para relajar los musculos. Si persiste, consulta a un fisioterapeuta.'];
        X = gluteo, R = ['Evita ejercicios que causen molestias en los gluteos. Aplica hielo para reducir la inflamacion. Si persiste, consulta a un especialista.'];
        X = pantorrilla, R = ['Descansa la pantorrilla y evita correr o saltar. Aplica hielo para reducir la inflamacion. Si persiste, consulta a un fisioterapeuta.'];
        X = espalda, R = ['Evita movimientos que causen dolor en la espalda. Aplica calor para relajar los musculos. Si persiste, consulta a un especialista.'];
        R = ['Puede que tengas un dolor en', X, ' y aunque no sabemos con exactitud, te recomendamos visitar a un doctor para un analisis mas profundo.'] 
    ).

elizaSoluciones1(X, R) :- 
    \+soluciones1(X), 
    R = ['No tengo conocimiento acerca de soluciones para el dolor en', X].

soluciones1(hombro).
soluciones1(bicep).
soluciones1(tricep).
soluciones1(trapecio).
soluciones1(antebrazo).
soluciones1(cuadricep).
soluciones1(femoral).
soluciones1(gluteo).
soluciones1(pantorrilla).
soluciones1(espalda).



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
likes(pesas).
likes(proteinas).
likes(entrenamientos_de_alta_intensidad).
likes(yoga).
likes(batidos_proteicos).
likes(correr_en_cinta).
likes(culturismo).
likes(rutinas_de_fuerza).
likes(boxeo).
likes(zapatillas_deportivas).
likes(clases_de_zumba).
likes(trepar).
likes(pilates).
likes(suplementos_pre_entrenamiento).
likes(caminatas_por_la_playa).



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
hace(escucha_musica).
hace(va_al_Gym).
hace(dieta).
hace(juega_VideoJuegos).
hace(natacion).
hace(clases_de_spinning).
hace(pesas_rusas).
hace(entrenamiento_funcional).
hace(yoga_en_el_gym).
hace(toma_clases_de_crossfit).
hace(practica_pilates).
hace(usa_maquinas_de_cardio).
hace(hace_ejercicios_de_estiramiento).
hace(participa_en_competencias_de_levantamiento_de_pesas).
hace(aprende_nuevas_rutinas_de_entrenamiento).
hace(utiliza_bandas_elasticas_en_sus_entrenamientos).
hace(entrena_con_un_entrenador_personal).
hace(practica_artes_marciales).
hace(organiza_clases_grupales_de_entrenamiento).



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
conoce(cancer_de_prostata).
conoce(tratamientos_del_cancer_de_prostata).



match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
    atom(S), % si I es un s(X) devuelve falso
    S == I,
    match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continuo con el resto de la lista
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

% Arnold Sintomas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSintomas,
    elizaSintomas(Atom, R).

    % Arnold sintomas1:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSintomas1,
    elizaSintomas1(Atom, R).

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

% Arnold Soluciones:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSoluciones,
    elizaSoluciones(Atom, R).
    
 % Arnold soluciones1:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSoluciones1,
    elizaSoluciones1(Atom, R).

% sintomas dobles gym
    replace0([I,J|_], Input, _,Resp, R):-
    nth0(I,Input,Atom),
    nth0(0,Resp,X),
    X == flagGym,
    nth0(J,Input,Atom1),
    nth0(0,Resp,Y),
    Y == flagGym,
    sintomasDGym(Atom ,Atom1 , R).
    
    % sintomas dobles cancer de prostata
    replace0([I,J|_], Input, _,Resp, R):-
    nth0(I,Input,Atom),
    nth0(0,Resp,X),
    X == flagSinDoble,
    nth0(J,Input,Atom1),
    nth0(0,Resp,Y),
    Y == flagSinDoble,
    sintomasDobles(Atom ,Atom1 , R).

    % sintomas sintomasTriples cancer de prostata
        replace0([I,J,K|_], Input, _,Resp, R):-
        nth0(I,Input,Atom),
        nth0(0,Resp,X),
        X == flagSinTriple,
        nth0(J,Input,Atom1),
        nth0(0,Resp,Y),
        Y == flagSinTriple,
        nth0(K,Input,Atom2),
        nth0(0,Resp,Z),
        Z == flagSinTriple,
        sintomasTriples(Atom ,Atom1 ,Atom2, R).