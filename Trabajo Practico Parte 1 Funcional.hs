-- Trabajo Practico Parte 1 Funcional

{-# LANGUAGE NoMonomorphismRestriction #-}
import Data.List -- para los metodos coleccionables que no vienen en la guia de lenguaje
import Data.Maybe -- por si llegan a usar un metodo de coleccion y devuelva Nothing or justElements
import Text.Show.Functions -- para que las funciones dentro del data se vean <function>
import Test.Hspec -- para usar los test
--Para que funcionen los test instalar lo siguiente mediante la terminal de windows
--cabal update
--cabal install hspec

--Test basados en los casos de prueba y en la programación TTD -> Test-Driven-Development (desarrollo dirigido por tests)

ejecutarTest = hspec $ do
  describe "Test del punto 3.1" $ do
    it "Rocha despues de hacer su truco queda en 500 de nafta" $ (nivelNafta.deReversa) rochaMcQueen `shouldBe` 500
    it "Velocidad de biankerr despues de hacer su truco es 40" $ (velocidad.impresionar) biankerr `shouldBe` 40
    it "Velocidad de gushtav despues de hacer su truco es 145" $ (velocidad.nitro) gushtav `shouldBe` 145
    it "La enamorade de rodra cambia por Petra con su truco" $ (enamorade.(fingirAmor "petra")) rodra `shouldBe` "petra"
  describe "Test del punto 3.2" $ do
    it "Velocidad de rocha despues de incrementar velocidad es 15" $ (velocidad.incrementarVelocidad) rochaMcQueen `shouldBe` 15
    it "Velocidad de biankerr despues de incrementar velocidad es 35" $ (velocidad.incrementarVelocidad) biankerr `shouldBe` 35
    it "Velocidad de gushtav despues de incrementar velocidad es 160" $ (velocidad.incrementarVelocidad) gushtav `shouldBe` 160
    it "Velocidad de rodra despues de incrementar velocidad es 70" $ (velocidad.incrementarVelocidad) rodra `shouldBe` 70
  describe "Test del punto 3.3" $ do
    it "Rocha puede realizar su truco" $ (puedeRealizarTruco rochaMcQueen) `shouldBe` True
    it "Gushtav no puede usar su truco" $ (puedeRealizarTruco gushtav) `shouldBe` False
    it "Rodra no puede usar su truco" $ (puedeRealizarTruco rodra) `shouldBe` False
  describe "Test del punto 3.4" $ do
    it "La nafta de rocha despues de comboLoco debe ser 500" $ (nivelNafta.comboLoco) rochaMcQueen `shouldBe` 500
    it "La velocidad de rocha despues de comboLoco debe ser 15" $ (velocidad.comboLoco) rochaMcQueen `shouldBe` 15
    it "La velocidad de Rodra despues de usar queTrucazo con murcielago debe ser 80" $ (velocidad.queTrucazo "murcielago") rodra `shouldBe` 80
    it "La velocidad de gushtav despues de usar turbo es 2130" $ (velocidad.turbo) gushtav `shouldBe` 2130
    it "La nafta de gushtav despues de usar turbo es 0" $ (nivelNafta.turbo) gushtav `shouldBe` 0
    it "La velocidad de rodra despues de usar turbo es 50" $ (velocidad.turbo) rodra `shouldBe` 50
    it "La nafta de rodra despues de usar turbo es de 0" $ (nivelNafta.turbo) rodra `shouldBe` 0

-- PUNTO 1

data Auto = Auto {
        nombre :: String,
        nivelNafta :: Float,
        velocidad :: Float,
        enamorade :: String,
        trucoEspecial :: Auto -> Auto
        } deriving Show

rochaMcQueen = Auto "RochaMcQueen" 300 0 "Ronco" deReversa
biankerr = Auto "biankerr" 500 20 "Tinch" impresionar
gushtav = Auto "Gushtav" 200 130 "PetiLaLinda" nitro
rodra = Auto "Rodra" 0 50 "Taisa" (fingirAmor "petra")

metrosPista = 1000

deReversa :: Auto -> Auto
deReversa unAuto = unAuto {nivelNafta = nivelNafta unAuto + ((velocidad unAuto)*1/5)}

{- A fin de que los test no fallen es necesario usar este "deReversa" puesto que para la segunda parte fue modificado
deReversa :: Auto -> Auto
deReversa unAuto = unAuto {nivelNafta = nivelNafta unAuto + (metrosPista*1/5)
-}

impresionar :: Auto -> Auto
impresionar unAuto =  unAuto {velocidad =  velocidad unAuto *2}

incremetarXVelocidad :: Float -> Auto -> Auto
incremetarXVelocidad incremento unAuto = unAuto {velocidad = velocidad unAuto + incremento}

nitro :: Auto -> Auto
nitro = incremetarXVelocidad 15

fingirAmor::  String -> Auto -> Auto
fingirAmor otroEnamorade unAuto = unAuto {enamorade = otroEnamorade}

-- PUNTO 2
esVocal 'a' = True
esVocal 'e' = True
esVocal 'i' = True
esVocal 'o' = True
esVocal 'u' = True
esVocal _ = False
-- vocalesDelEnamorades letra = elem letra "aeiouAEIOU"


vocalesDelEnamorade :: Auto -> Int
vocalesDelEnamorade unAuto = length.filter esVocal $ (enamorade unAuto)

incrementarVelocidad :: Auto -> Auto
incrementarVelocidad unAuto | vocalesDelEnamorade unAuto <= 2 = incremetarXVelocidad 15 unAuto
                            | vocalesDelEnamorade unAuto <= 4 = incremetarXVelocidad 20 unAuto
                            | otherwise = incremetarXVelocidad 30 unAuto

-- PUNTO 3

tieneNafta :: Auto -> Bool
tieneNafta unAuto = (nivelNafta unAuto) > 0

velocidadMenorA100 :: Auto -> Bool
velocidadMenorA100 unAuto = (velocidad unAuto) < 100

puedeRealizarTruco :: Auto -> Bool
puedeRealizarTruco unAuto = (tieneNafta unAuto) && (velocidadMenorA100 unAuto)

-- PUNTO 4

comboLoco :: Auto -> Auto
comboLoco = nitro.deReversa

queTrucazo :: String -> Auto -> Auto
queTrucazo unEnamorade = (incrementarVelocidad.fingirAmor unEnamorade)

naftaA0 :: Auto -> Auto
naftaA0 unAuto = unAuto {nivelNafta = 0}

multiplicaVelPor10SegunNafta :: Auto -> Auto
multiplicaVelPor10SegunNafta unAuto = unAuto {velocidad = velocidad unAuto + ((*10).(nivelNafta)) unAuto}

turbo :: Auto -> Auto
turbo = naftaA0.multiplicaVelPor10SegunNafta

------------------------ PARTE 2 ------------------------
ejecutarTest2 = hspec $ do
  describe "Test 3.0" $ do
    it "nafta de rochaMcQueen luego de hacer el truco favorito, debe ser 490" $ (nivelNafta.deReversa) rochaMcQueen `shouldBe` 490
    it "nafta de rodra tras 'impresionar', debe ser 10" $ (nivelNafta.impresionar) rodra `shouldBe` 10
  describe "Test 3.2" $ do
    it "cantidad de participantes luego de sacarAlPistero , debe ser 3" $ ((length.sacarAlPistero) (participantes potreroFunes)) `shouldBe` 3
    it "rochaMcQueen no participa en potreroFunes luego de sacarAlPistero, False" $  elem "rochaMcQueen" (map nombre (sacarAlPistero (participantes potreroFunes)))  `shouldBe` False
    it "cantidad de participantes luego de pocaReserva en potreroFunes, debe ser 2" $ length (pocaReserva (participantes potreroFunes)) `shouldBe` 2 -- estara mal enunciado ? observar velocidad data Auto
    it " rodra ya no deberia participar mas luego de aplicar pocaReserva , False" $ elem "rodra" (map nombre (pocaReserva (participantes potreroFunes))) `shouldBe` False
    it "cantidad de participantes luego de podio a potreroFunes, debe ser 3" $ ((length.podio) (participantes potreroFunes)) `shouldBe` 3
--    it "velocidad del ultimo participante (rodra) luego de la lluvia, debe ser 40 " $ (nombre.(lluvia (participantes potreroFunes)) `shouldBe` "rodra"
--describe "Test 3.3" $ do
--   it "nivel de nafta del primer participante (de biankerr) luego de dar una vuelta, debe ser 490" $ head (map nivelNafta ((participantes.darVuelta) potreroFunes) `shouldBe` 490
--   it "velocidad del primer participantes (biankerr) luego de dar una vuelta, debe ser 40 " $ head (map velocidad ((participantes.darVuelta) potreroFunes) `shouldBe` 40
--   it "cantidad de participantes luego de dar 2 vueltas en potreroFunes, debe ser 2 " $ length (map (participantes.darVuelta.darVuelta) potreroFunes)) `shouldBe` 2
--   it "luego de dar 2 vueltas , saber el nivelDeNafta del Primer participante (gushtav), debe ser 70" $ head (map ((participantes.darVuelta.darVuelta) potreroFunes)) `shouldBe` 70
--   it " rodra debe ser el unico luego de correr la carrera, True " $ head (map nombre ((participantes.correr) potreroFunes)) `shouldBe` "rodra"
--describe "Test 3.4" $ do
--   it " ganador de la carrera potreroFunes, debe ser rodra" $ quienGana potreroFunes `shouldBe` "rodra"
--   it ""
--describe "Test 3.5" $ do
--   it " velocidad de rodra tras realizar el gran truco con nitro deReversa e impresionar" $ (velocidad.elGranTruco) rodra `shouldBe` 140
--   it " nivelDeNafta de rodra  tras ralizar el granTrcuo" , debe ser 13 $ (nivelDeNafta.elGranTruco) rodra `shouldBe` 13



--Modificación de truco de Rocha, se expresa en comentario a fin de no definirlo dos veces, pero si ver reflejado el progreso
{-
deReversa :: Auto -> Auto
deReversa unAuto = unAuto {nivelNafta = nivelNafta unAuto + ((velocidad unAuto)*1/5)}
-}

-- Punto 1 --

data Carrera = Carrera {
     cantidadDeVueltas :: Int,
     longitudDePista :: Float,
     publico :: [String],
     trampa :: [Auto] -> [Auto], -- las funciones estan hecha para ser aplicadas a las carreras
     participantes :: [Auto] -- debe ser lista, sino rompe, ademas de que se esta coleccionando en una jaja
} deriving Show

-- Punto 3.1 --

potreroFunes = Carrera 3 5.0 ["Ronco", "Tinch", "Dodian"] sacarAlPistero [rochaMcQueen,biankerr,gushtav,rodra]

-- Punto 3.2 --

sacarAlPistero :: [Auto] -> [Auto] -- dice el primer participante, osea dejo la cola y saco al primero
sacarAlPistero unosAutos = tail unosAutos

lluvia :: [Auto] -> [Auto]
lluvia unosAutos =  map (incremetarXVelocidad (-10)) unosAutos

neutralizarTrucos :: [Auto] -> [Auto]
neutralizarTrucos unosAutos = id unosAutos

pocaReserva :: [Auto] -> [Auto]
pocaReserva unosAutos = filter ((>30).velocidad) unosAutos

podio :: [Auto] -> [Auto]
podio unosAutos = take 3 unosAutos

-- PUNTO 3.3 --
-- modifico este pedazo de codigo por que sino, me rompe con los tipos caundo quiera modificar a los participantes de la carrera
combustibleEnCarrera :: Carrera -> Auto -> Auto
combustibleEnCarrera unaCarrera unAuto = unAuto {nivelNafta = (longitudDePista unaCarrera) / 10* (velocidad unAuto) }

estaElEnamoradeEnElPublico :: Carrera -> Auto -> Bool
estaElEnamoradeEnElPublico unaCarrera unAuto  = elem (enamorade unAuto) (publico unaCarrera)

-- trato de obtener la funcion de que el participante que al cumplir estas condiciones, haga su truco especial, entonces devolveria una funcion
-- es lo que yo interpreto , ya de ahi al aplicar dar la vuelta de toco a los participantes
hacerTruco :: Carrera -> Auto -> Auto
hacerTruco unaCarrera unAuto | (estaElEnamoradeEnElPublico unaCarrera unAuto) && (puedeRealizarTruco unAuto) = (trucoEspecial unAuto) unAuto
                             | otherwise = unAuto


-- sufrirTrampaCarrera unaCarrera = (trampa unaCarrera)
sufrirTrampaCarrera :: Carrera -> Carrera
sufrirTrampaCarrera unaCarrera = modificarCarrera ((trampa unaCarrera)) unaCarrera

aplicarTrucoACarrera :: Carrera -> Carrera
aplicarTrucoACarrera unaCarrera =  modificarCarrera (map (hacerTruco unaCarrera)) unaCarrera

aplicarNaftaACarrera:: Carrera -> Carrera
aplicarNaftaACarrera unaCarrera = modificarCarrera (map (combustibleEnCarrera unaCarrera )) unaCarrera


darVuelta unaCarrera = (sufrirTrampaCarrera.aplicarTrucoACarrera.aplicarNaftaACarrera) unaCarrera



-- por que modificara a la carrera en base a los trucos
modificarCarrera :: ([Auto]->[Auto]) -> Carrera -> Carrera
modificarCarrera funcion unaCarrera = unaCarrera { participantes = (funcion.participantes) unaCarrera}

repetir 0 _ unaCarrera = unaCarrera
repetir vueltas funcionVuelta unaCarrera = repetir (vueltas - 1) funcionVuelta (funcionVuelta unaCarrera)

correr unaCarrera = repetir (cantidadDeVueltas unaCarrera) darVuelta unaCarrera

-- PUNTO 3.4 --

mayorVelocidad unAuto otroAuto | velocidad unAuto < velocidad otroAuto = otroAuto
                               | otherwise = unAuto

elMasVeloz unaCarrera = foldl mayorVelocidad ((head.participantes) unaCarrera) (participantes unaCarrera)                               
quienGana unaCarrera = (elMasVeloz.correr) unaCarrera


-- PUNTO 3.5
elGranTruco :: Auto -> [Auto -> Auto] ->  Auto
elGranTruco unAuto unosTrucos  = (listarTrucos unosTrucos) unAuto

listarTrucos unosTrucos = foldl1 (.) unosTrucos

--Armar funcion de velocidad de auto (velocidad participantes unaCarrera)
--Evaluacion diferida y depende del truco para la lista infinita, preguntas teoria 
