
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
template([me, puedes, recomendar, una, rutina, de, entrenamiento, para, s(_)], 
         ['Claro', 'Aqui tienes una rutina de entrenamiento recomendada:', rutina(_)], [9]).

template([cuales, son, los, beneficios, de, hacer, ejercicio, regularmente],
         ['Hacer ejercicio regularmente tiene muchos beneficios para la salud. Algunos de ellos incluyen:', beneficios_ejercicio], []).

template([que, debo, comer, antes, de, hacer, ejercicio],
         ['Es importante tener una comida equilibrada antes de hacer ejercicio. Puedes considerar comer alimentos ricos en carbohidratos y proteinas.', dieta_antes_ejercicio], []).

template([como, puedo, mantenerme, motivado, para, hacer, ejercicio],
         ['Mantenerse',motivado,puede,ser,un,desafio.para,ello,te,recomiendo,:,], []).

template([cuanto, tiempo, debo, descansar, entre, series],
         ['El', tiempo, de, descanso, entre, series, puede, variar, pero ,generalmente ,se, recomienda, descansar, de, 30, segundos, a, 1, minuto, sin, embargo, esto, depende, de, tus, objetivos, y, nivel, de, entrenamiento], []).

template([que, ejercicios, son, buenos, para, trabajar, s(_)],
         ['Hay varios ejercicios efectivos para trabajar', s(_), '. Algunos de ellos incluyen:', ejercicios_recomendados], [6]).

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
