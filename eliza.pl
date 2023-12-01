
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
         ['Mantenerse motivado para hacer ejercicio puede ser un desafio, pero aqui hay algunos consejos:', mantener_motivacion], []).

template([cuanto, tiempo, debo, descansar, entre, series],
         ['El tiempo de descanso entre series puede variar, pero generalmente se recomienda descansar de 30 segundos a 1 minuto. Sin embargo, esto depende de tus objetivos y nivel de entrenamiento.'], []).

template([que, ejercicios, son, buenos, para, trabajar, s(_)],
         ['Hay varios ejercicios efectivos para trabajar', s(_), '. Algunos de ellos incluyen:', ejercicios_recomendados], [6]).

template(_, ['Por favor', explicate, un, poco, mas, no, te, entiendo,'.'], []). 

% rutinas
rutina(fuerza,['Para ganar fuerza metele pesado skinny bitch']).
rutina(principiantes, ['Para principiantes, se recomienda comenzar con una rutina de cuerpo completo 2-3 veces por semana. Incluye ejercicios como flexiones, sentadillas, y levantamiento de pesas ligeras.']).
rutina(intermedios, ['Los intermedios pueden realizar una combinación de entrenamiento de fuerza y cardio. Considera dividir tus días entre partes superiores e inferiores y agregar ejercicios más avanzados.']).
rutina(avanzados, ['Para aquellos en un nivel avanzado, puedes incorporar rutinas de entrenamiento más especializadas, como entrenamiento de fuerza focalizado o entrenamiento de alta intensidad (HIIT). Asegúrate de incluir suficiente variedad.']).

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
likes(drogas).
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
arnoldEs(X, R):- is0(X), R = ['Si', yo, soy, X].
arnoldEs(X, R):- \+is0(X), R = ['No', yo, no, soy, X].
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

% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagLike,
    arnoldLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagDo,
    arnoldDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagIs,
        arnoldIs(Atom, R).

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
