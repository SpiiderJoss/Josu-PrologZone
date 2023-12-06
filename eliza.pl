
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

template([alumno, _], ['Josue Montalvan Zavala'],[]).

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



template(_, ['Por favor explicate un poco mas no te entiendo,'], []). 

% ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
% Templates cancer de prostata

% Sintomas - cancer prostata
		template([si, tengo, dolor, de , s(_), es, sintoma, de, cancer,de, prostata, _], [flagSintomas], [4]).
		template([si, tengo, s(_), es, sintoma, de, cancer,de,prostata, _], [flagSintomas], [3]).

% Soluciones - cancer de prostata
		template([que, debo, de, tomar, si, tengo, dolor, al, s(_), _], [flagSoluciones], [8]).
		template([tengo, dolor, al, s(_)], [flagSoluciones], [3]).
		template([tengo, un, s(_)], [flagSoluciones], [3]).
		template([tengo, s(_)], [flagSoluciones], [1]).


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

% Template sobre tratamientos del cáncer de prostata
template([tratamientos, del, cancer, de, prostata], 
    ['El tratamiento del cáncer de próstata puede variar según el estadio de la enfermedad y la salud general del paciente 
     Algunas opciones de tratamiento incluyen:
     1.- Cirugía: La prostatectomía es la extirpación quirúrgica de la próstata
     2.- Radioterapia: Utiliza radiación para destruir las células cancerosas
     3.- Terapia hormonal: Busca reducir los niveles de testosterona para frenar el crecimiento del cáncer
     4.- Vigilancia activa: Monitorización cercana sin tratamiento inmediato, especialmente para casos de bajo riesgo
     5.- Quimioterapia: Puede ser utilizada en casos avanzados para tratar células cancerosas que se han diseminado'], []).

% Template sobre efectos secundarios y manejo durante el tratamiento
template([efectos, secundarios, y, manejo, tratamiento, cancer, prostata], 
    ['Es importante tener en cuenta que cada opción de tratamiento puede llevar consigo efectos secundarios. Algunas consideraciones incluyen:
     - Cirugía: Puede haber efectos secundarios como incontinencia urinaria o disfunción eréctil.
     - Radioterapia: Posibles efectos secundarios incluyen fatiga, irritación de la piel y cambios en la función eréctil.
     - Terapia hormonal: Puede causar efectos secundarios como disminución del deseo sexual y aumento de peso. 
     - Quimioterapia: Puede provocar náuseas, pérdida de cabello y fatiga 
     El manejo de estos efectos secundarios generalmente se discute y aborda con el equipo médico.'], []).

% Template sobre toma de decisiones y apoyo emocional
template([toma, de, decisiones, y, apoyo, emocional, tratamiento, cancer, prostata], 
    ['La toma de decisiones sobre el tratamiento del cáncer de próstata es personal y puede ser difícil. Algunos aspectos a considerar incluyen:', 
     '- Consulta con profesionales: Habla con tu oncólogo y otros profesionales de la salud para comprender las opciones y sus implicaciones.', 
     '- Apoyo emocional: Busca apoyo emocional de amigos, familiares o grupos de apoyo.', 
     '- Segunda opinión: Si es necesario, considera buscar una segunda opinión médica antes de tomar decisiones importantes.'], []).

% Template sobre tratamientos del cáncer de próstata
template([tratamientos, del, cancer, de, prostata], 
    ['El tratamiento del cáncer de próstata puede variar según el estadio de la enfermedad y la salud general del paciente.', 
     'Algunas opciones de tratamiento incluyen:', 
     '- Cirugía: La prostatectomía es la extirpación quirúrgica de la próstata.', 
     '- Radioterapia: Utiliza radiación para destruir las células cancerosas.', 
     '- Terapia hormonal: Busca reducir los niveles de testosterona para frenar el crecimiento del cáncer.', 
     '- Vigilancia activa: Monitorización cercana sin tratamiento inmediato, especialmente para casos de bajo riesgo.', 
     '- Quimioterapia: Puede ser utilizada en casos avanzados para tratar células cancerosas que se han diseminado.'], []).

% Template sobre efectos secundarios y manejo durante el tratamiento
template([efectos, secundarios, y, manejo, tratamiento, cancer, prostata], 
    ['Es importante tener en cuenta que cada opción de tratamiento puede llevar consigo efectos secundarios. Algunas consideraciones incluyen:', 
     '- Cirugía: Puede haber efectos secundarios como incontinencia urinaria o disfunción eréctil.', 
     '- Radioterapia: Posibles efectos secundarios incluyen fatiga, irritación de la piel y cambios en la función eréctil.', 
     '- Terapia hormonal: Puede causar efectos secundarios como disminución del deseo sexual y aumento de peso.', 
     '- Quimioterapia: Puede provocar náuseas, pérdida de cabello y fatiga.', 
     'El manejo de estos efectos secundarios generalmente se discute y aborda con el equipo médico.'], []).

% Template sobre toma de decisiones y apoyo emocional
template([toma, de, decisiones, y, apoyo, emocional, tratamiento, cancer, prostata], 
    ['La toma de decisiones sobre el tratamiento del cáncer de próstata es personal y puede ser difícil. Algunos aspectos a considerar incluyen:', 
     '- Consulta con profesionales: Habla con tu oncólogo y otros profesionales de la salud para comprender las opciones y sus implicaciones.', 
     '- Apoyo emocional: Busca apoyo emocional de amigos, familiares o grupos de apoyo.', 
     '- Segunda opinión: Si es necesario, considera buscar una segunda opinión médica antes de tomar decisiones importantes.'], []).

% Template sobre datos estadísticos del cáncer de próstata
template([datos, estadisticos, del, cancer, de, prostata], 
    ['El cáncer de próstata es una enfermedad común en los hombres, y las estadísticas proporcionan una visión de su impacto:', 
     'Según datos recientes:', 
     '- Incidencia: El cáncer de próstata es uno de los cánceres más diagnosticados en hombres a nivel mundial.', 
     '- Factores de riesgo: La incidencia aumenta con la edad, y se observa una mayor prevalencia en hombres de raza negra.', 
     '- Supervivencia: Las tasas de supervivencia son altas, especialmente cuando el cáncer se detecta y trata en sus etapas tempranas.'], []).

% Template sobre la importancia de la detección temprana
template([importancia, deteccion, temprana, datos, estadisticos, cancer, prostata], 
    ['La detección temprana del cáncer de próstata juega un papel clave en las tasas de supervivencia y el éxito del tratamiento.', 
     'Las pruebas de detección, como el PSA (antígeno prostático específico), pueden ayudar a identificar la enfermedad en etapas tempranas cuando las opciones de tratamiento son más efectivas.'], []).

% Template sobre variabilidad en las tasas de incidencia
template([variabilidad, tasas, incidencia, cancer, prostata], 
    ['Es importante destacar que las tasas de incidencia del cáncer de próstata pueden variar según la región geográfica y los grupos étnicos.', 
     'Factores genéticos, ambientales y de estilo de vida pueden contribuir a estas variaciones.'], []).

% Hechos que definen síntomas y factores de riesgo
% Sintomas
		elizaSintomas(X, R) :-
			sintomas(X),
			(
				X = dificultad_al_orinar, R = ['Sí, la dificultad al orinar es sintoma de cancer de prostata'];
				X = orina_interrumpida, R = ['Sí, la orina interrumpida es sintoma de cancer de prostata'];
				X = miccion, R = ['Sí, la micción frecuente puede ser un síntoma de la cancer de prostata.'];
				X = ardor_al_orinar, R = ['Sí, el ardor al orinar es sintoma de cancer de prostata'];
				X = sangre_en_orina, R = ['Sí, la sangre en la orina o semen es sintoma de cancer de prostata'];
				X = dolor_en_espalda, R = ['Sí, el dolor en la espalda es sintoma de cancer de prostata'];
				X = dolor_al_eyacular, R = ['Sí, el dolor al eyacular es sintoma de cancer de prostata'];	
				R = ['Sí, el dolor de', X, 'puede ser un síntoma de cancer de prostata']
			).

		elizaSintomas(X, R):- \+sintomas(X), R = [al, parecer, el, sintoma, X , no, es, sintoma, de, cancer,de , prostata].

        sintomas(dificultad_al_orinar).
		sintomas(orina_interrumpida).
		sintomas(miccion).
		sintomas(ardor_al_orinar).
		sintomas(sangre_en_orina).
		sintomas(dolor_en_espalda).
		sintomas(dolor_al_eyacular).

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

		soluciones(estomago).
        soluciones(miccion).
        soluciones(dolor).

		
		



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

% Arnold Sintomas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSintomas,
    elizaSintomas(Atom, R).


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

% Eliza Soluciones:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSoluciones,
    elizaSoluciones(Atom, R).