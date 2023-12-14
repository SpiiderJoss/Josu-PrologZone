% Declaraciones de enfermedades
enfermedad(gripe).
enfermedad(rubeola).
enfermedad(malaria).
enfermedad(hepatitis).
enfermedad(tuberculosis).
enfermedad(anemia).

% Declaraciones de síntomas según enfermedad
sintomade(tos, gripe).
sintomade(cansancio, gripe).
sintomade(fiebre, gripe).
sintomade(dolorcabeza, gripe).
sintomade(nauseas, hepatitis).
sintomade(diarrea, hepatitis).
sintomade(ictericia, hepatitis).
sintomade(cansancio, anemia).
sintomade(apatia, anemia).
sintomade(nausea, anemia).
sintomade(tos, tuberculosis).
sintomade(cansancio, tuberculosis).
sintomade(fiebre, tuberculosis).
sintomade(escalofrios, tuberculosis).
sintomade(escalofrios, malaria).
sintomade(fiebre, malaria).
sintomade(diarrea, malaria).
sintomade(ictericia, malaria).
sintomade(fiebre, rubeola).
sintomade(jaqueca, rubeola).
sintomade(secrecion, rubeola).

% Reglas para determinar la probabilidad de una enfermedad según los síntomas
buscar([], _, 0).
buscar([X | Xs], E, P) :-
    sintomade(X, E),
    buscar(Xs, E, S2),
    P is S2 + 1.
buscar([_ | Xs], E, P) :- buscar(Xs, E, P).

cantSint(E, C) :- findall(X, sintomade(X, E), L), length(L, C).

diagnostico([], _, 0).
diagnostico([X | Xs], E, K) :-
    buscar([X | Xs], E, P),
    cantSint(E, T),
    K is P * 100 / T.

% Declaraciones de medicamentos para enfermedades
medicinade(contrex, gripe).
medicinade(jarabe, gripe).
medicinade(pastillas, tuberculosis).
medicinade(vacuna, malaria).
medicinade(vacuna, rubeola).
medicinade(vitaminas, anemia).
medicinade(pastillas, hepatitis).

% Declaraciones de especialistas para enfermedades
especialistade(otorrino, gripe).
especialistade(nutricionista, anemia).
especialistade(endocrinologia, hepatitis).
especialistade(medicinageneral, rubeola).
especialistade(nutricionista, tuberculosis).
especialistade(medicinageneral, malaria).

% Regla para determinar qué especialista atiende a una enfermedad
atiendeespecialista(Especialista, Enfermedad) :- especialistade(Especialista, Enfermedad).

% Regla para obtener medicamento y especialista según síntoma y enfermedad
mereceta(Especialista, Medicamento, Enfermedad) :-
    sintomade(Sintoma, Enfermedad),
    medicinade(Medicamento, Enfermedad),
    atiendeespecialista(Especialista, Sintoma). 