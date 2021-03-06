%% candidato (Nombre, Partido)
candidato(frank,rojo).
candidato(claire,rojo).
candidato(garret, azul).
candidato(jackie, amarillo).
candidato(linda, azul).
candidato(catherine,rojo).
candidato(seth,amarillo).
candidato(heather,amarillo).

%% edad (Nombre, Edad).
edad(frank,50).
edad(claire,52).
edad(garret,64).
edad(peter,26).
edad(jackie,38).
edad(linda,30).
edad(catherine,59).
edad(heather,50). %% por que reste 2019-1969 , creo que prolog no podia hacer operaciones asi no?

%% partidoSePostulaEn(Partido,Provincia)

partidoSePostulaEn(azul,buenosAires).
partidoSePostulaEn(azul,chaco).
partidoSePostulaEn(azul,tierraDelFuego).
partidoSePostulaEn(azul,sanLuis).
partidoSePostulaEn(azul,neuquen).
partidoSePostulaEn(rojo,buenosAires).
partidoSePostulaEn(rojo,santaFe).
partidoSePostulaEn(rojo,cordoba).
partidoSePostulaEn(rojo,chubut).
partidoSePostulaEn(rojo,tierraDelFuego).
partidoSePostulaEn(rojo,sanLuis).
partidoSePostulaEn(amarillo,chaco).
partidoSePostulaEn(amarillo,formosa).
partidoSePostulaEn(amarillo,tucuman).
partidoSePostulaEn(amarillo,salta).
partidoSePostulaEn(amarillo,santaCruz).
partidoSePostulaEn(amarillo,laPampa).
partidoSePostulaEn(amarillo,corrientes).
partidoSePostulaEn(amarillo,misiones).
partidoSePostulaEn(amarillo,buenosAires).

%% habitantes(provincia, habitantes).

habitantes(buenosAires,15355000).
habitantes(chaco,1143201).
habitantes(tierraDelFuego,160720).
habitantes(sanLuis,489255).
habitantes(neuquen,637913).
habitantes(santaFe,3397532).
habitantes(cordoba,3567654).
habitantes(chubut,577466).
habitantes(formosa,527895).
habitantes(tucuman,1687305).
habitantes(salta,1333365).
habitantes(santaCruz,273964).
habitantes(laPampa,349299).
habitantes(corrientes,992595).
habitantes(misiones,1189446).

%% BDC Las PASO : intencionDeVotosEn​(Provincia,Partido,Porcentaje).

intencionDeVotosEn(buenosAires,rojo,40).
intencionDeVotosEn(buenosAires,azul,30).
intencionDeVotosEn(buenosAires,amarillo,30).
intencionDeVotosEn(chaco,rojo,50).
intencionDeVotosEn(chaco,azul,20).
intencionDeVotosEn(chaco,amarillo,0).
intencionDeVotosEn(tierraDelFuego,rojo,40).
intencionDeVotosEn(tierraDelFuego,azul,20).
intencionDeVotosEn(tierraDelFuego,amarillo,10).
intencionDeVotosEn(sanLuis,rojo,50).
intencionDeVotosEn(sanLuis,azul,20).
intencionDeVotosEn(sanLuis,amarillo,0).
intencionDeVotosEn(neuquen,rojo,80).
intencionDeVotosEn(neuquen,azul,10).
intencionDeVotosEn(neuquen,amarillo,0).
intencionDeVotosEn(santaFe,rojo,20).
intencionDeVotosEn(santaFe,azul,40).
intencionDeVotosEn(santaFe,amarillo,40).
intencionDeVotosEn(cordoba,rojo,10).
intencionDeVotosEn(cordoba,azul,60).
intencionDeVotosEn(cordoba,amarillo,20).
intencionDeVotosEn(chubut,rojo,15).
intencionDeVotosEn(chubut,azul,15).
intencionDeVotosEn(chubut,amarillo,15).
intencionDeVotosEn(formosa,rojo,0).
intencionDeVotosEn(formosa,azul,0).
intencionDeVotosEn(formosa,amarillo,0).
intencionDeVotosEn(tucuman,rojo,40).
intencionDeVotosEn(tucuman,azul,40).
intencionDeVotosEn(tucuman,amarillo,20).
intencionDeVotosEn(salta,rojo,30).
intencionDeVotosEn(salta,azul,60).
intencionDeVotosEn(salta,amarillo,10).
intencionDeVotosEn(santaCruz,rojo,10).
intencionDeVotosEn(santaCruz,azul,20).
intencionDeVotosEn(santaCruz,amarillo,30).
intencionDeVotosEn(laPampa,rojo,25).
intencionDeVotosEn(laPampa,azul,25).
intencionDeVotosEn(laPampa,amarillo,40).
intencionDeVotosEn(corrientes,rojo,30).
intencionDeVotosEn(corrientes,azul,30).
intencionDeVotosEn(corrientes,amarillo,10).
intencionDeVotosEn(misiones,rojo,90).
intencionDeVotosEn(misiones,azul,0).
intencionDeVotosEn(misiones,amarillo,0).


%% PUNTO 2

esPicante(Provincia):-
	sePresentaMismaProvincia(Provincia),
	habitantes(Provincia,Cantidad),
	Cantidad > 1000000.

sePresentaMismaProvincia(Provincia):-
	partidoSePostulaEn(Partido,Provincia),
	partidoSePostulaEn(Partido2,Provincia),
	Partido \= Partido2. %% Para no repetir logica se compara unicamente contra los partidos como se pidio.

%% PUNTO 3

leGana(Candidato1,Candidato2,Provincia):-
	compitenMismaProvincia(Candidato1,Candidato2,Provincia),
	analizarPorcentajeVoto(Candidato1,Candidato2,Provincia),
	Candidato1 \= Candidato2.

leGana(Candidato1,_,Provincia):-
	candidato(Candidato1,Partido),
	partidoSePostulaEn(Partido,Provincia).

leGana(Candidato1,Candidato2,Provincia):-
	pertenecenAmismoPartido(Candidato1,Candidato2,Provincia).

compitenMismaProvincia(Candidato1,Candidato2,Provincia):-
	candidato(Candidato1,Partido1),
	candidato(Candidato2,Partido2),
	partidoSePostulaEn(Partido1,Provincia),
	partidoSePostulaEn(Partido2,Provincia),
	Partido1 \= Partido2.

analizarPorcentajeVoto(Candidato1,Candidato2,Provincia):-
	porcentajeVoto(Candidato1,Provincia,Porcentaje1),
	porcentajeVoto(Candidato2,Provincia,Porcentaje2),
	Porcentaje1>Porcentaje2,
	Porcentaje1\=Porcentaje2.

porcentajeVoto(Candidato,Provincia,Porcentaje):-
	candidato(Candidato,Partido),
	intencionDeVotosEn(Provincia,Partido,Porcentaje).

pertenecenAmismoPartido(Candidato1,Candidato2,Provincia):-
	candidato(Candidato1,Partido1),
	candidato(Candidato2,Partido2),
	partidoSePostulaEn(Partido1,Provincia),
	partidoSePostulaEn(Partido2,Provincia),
	Partido1 = Partido2.

%% PUNTO 4

elGranCandidato(Candidato):-
	esCandidato(Candidato),
	forall((candidato(Candidato,Partido),partidoSePostulaEn(Partido,Provincia)),leGana(Candidato,_,Provincia)),
	esElMasJovencito(Candidato).

esCandidato(Candidato):- candidato(Candidato,_).

esElMasJovencito(Candidato):-
	candidato(Candidato,Partido),
	forall(candidato(Candidato,Partido),compararEdad(Candidato,_)).

compararEdad(Candidato,Candidato2):-
	edad(Candidato,Edad),
	edad(Candidato2,Edad2),
	Edad >= Edad2.

%% PUNTO 5
elPartidoGana(Partido,UnaProvincia):-
	candidato(Candidato,Partido),
	leGana(Candidato,_,UnaProvincia).

ajusteConsultora(UnPartido,UnaProvincia,ElVerdaderoPorcentaje):-
	ajusteDe20(UnPartido,UnaProvincia,ElVerdaderoPorcentaje).

ajusteConsultora(UnPartido,UnaProvincia,ElVerdaderoPorcentaje):-
 ajusteDe5(UnPartido,UnaProvincia,ElVerdaderoPorcentaje).

ajusteDe20(UnPartido,UnaProvincia,ElVerdaderoPorcentaje):-
	elPartidoGana(UnPartido,UnaProvincia),
	intencionDeVotosEn(UnaProvincia,UnPartido,Porcentaje),
	ElVerdaderoPorcentaje is Porcentaje - 20.

ajusteDe5(UnPartido,UnaProvincia,ElVerdaderoPorcentaje):-
	not(elPartidoGana(UnPartido,UnaProvincia)),
	intencionDeVotosEn(UnaProvincia,UnPartido,Porcentaje),
	ElVerdaderoPorcentaje is Porcentaje + 5.


%% PUNTO 6
%%promete(Partido,Promesa).
promete(azul,construir(1000,hospirales)).
promete(azul,construir(100,jardines)).
promete(azul,construir(5,escuelas)).
promete(amarillo,construir(100,hospitales)).
promete(amarillo,construir(1,universidad)).
promete(amarillo,construir(200,comisarias)).
promete(rojo,generarPuestosTrabajo(800000)).
promete(amarillo,generarPuestosTrabajo(100000)).
promete(azul,inflacion(2,4)).
promete(amarillo,inflacion(1,15)).
promete(amarillo,inflacion(10,30)).

%% PUNTO 7

influenciasDePromesas(inflacion(InfalcionBaja,InfalcionAlta),VariacionDeVotos):-
	VariacionDeVotos is (InfalcionBaja+InfalcionAlta)/2.
influenciasDePromesas(generarPuestosTrabajo(Cantidad),3):-
	Cantidad > 50000.
influenciaSegunObra(Obra,2):-
	member(construir(_,hospitales),Obra).
influenciaSegunObra(Obra,Variacion):-
	member(construir(Cantidad,jardines),Obra),
	Variacion is (Cantidad * 0.1).
influenciaSegunObra(Obra,Variacion):-
	member(construir(Cantidad,escuelas),Obra),
	Variacion is Cantidad *0.1.
influenciaSegunObra(Obra,2):-
	member(construir(200,comisarias),Obra).
influenciasDePromesas(construir(Obra,_),VariacionDeVotos):-
	findall(Variacion,influenciaSegunObra(Obra,Variacion),Variaciones),
	sumlist(Variaciones,VariacionDeVotos).


%% PUNTO 8

promedioDeCrecimiento(Partido,Crecimiento):-
	promete(Partido,_),
	sumlist(influenciasDePromesas(_,VariacionDeVotos),Crecimiento).
