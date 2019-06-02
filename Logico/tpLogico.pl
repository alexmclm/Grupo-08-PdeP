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

%% postulacion(Partido,Provincia)

postulacion(azul,buenosAires).
postulacion(azul,chaco).
postulacion(azul,tierraDelFuego).
postulacion(azul,sanLuis).
postulacion(azul,neuquen).
postulacion(rojo,buenosAires).
postulacion(rojo,santaFe).
postulacion(rojo,cordoba).
postulacion(rojo,chubut).
postulacion(rojo,tierraDelFuego).
postulacion(rojo,sanLuis).
postulacion(amarillo,chaco).
postulacion(amarillo,formosa).
postulacion(amarillo,tucuman).
postulacion(amarillo,salta).
postulacion(amarillo,santaCruz).
postulacion(amarillo,laPampa).
postulacion(amarillo,corrientes).
postulacion(amarillo,misiones).
postulacion(amarillo,buenosAires).

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
	candidato(Nombre,Partido),
	postulacion(Partido,Provincia),
	candidato(Nombre2,Partido),
	postulacion(Partido2,Provincia),
	Nombre \= Nombre2,
	Partido \= Partido2.	

%% PUNTO 3
leGana(Candidato1,Candidato2,Provincia):-
	compitenMismaProvincia(Candidato1,Provincia),
	compitenMismaProvincia(Candidato2,Provincia),
	analizarPorcentajeVoto(Candidato1,Candidato2,Provincia).
	%% pertenecenAmismoPartido(Candidato1,Candidato2,Provincia).

%% para el punto1: aunque el pto 3 dice si ambos candidatos pertenecen al mismo partido, la relacion se cumple si es en la misma provincia
compitenMismaProvincia(Candidato,Provincia):-
	candidato(Candidato,Partido),
	postulacion(Partido,Provincia).
%%	Partido1 \= Partido2. %% saco o no saco?
	
analizarPorcentajeVoto(Candidato1,Candidato2,Provincia):-
	porcentajeVoto(Candidato1,Provincia,Porcentaje1),
	porcentajeVoto(Candidato2,Provincia,Porcentaje2),
		Porcentaje1>Porcentaje2.

porcentajeVoto(Candidato,Provincia,Porcentaje):-
	candidato(Candidato,Partido),
	intencionDeVotosEn(Provincia,Partido,Porcentaje).

	