-- Trabajo Practico Parte 1 Funcional

{-# LANGUAGE NoMonomorphismRestriction #-}
import Data.List -- para los metodos coleccionables que no vienen en la guia de lenguaje
import Data.Maybe -- por si llegan a usar un metodo de coleccion y devuelva Nothing or justElements
import Text.Show.Functions --
-- import Test.Hspec -- para usar los test
--Para que funcionen los test instalar lo siguiente mediante la terminal de windows
--cabal update
--cabal install hspec
--nueva prueba a ver si funca bien.
--Prueba a ver si reconoce mi nombre cuando hago el commit.

-- PUNTO 1

data Auto = Auto {
				nombre :: String,
				nivelNafta :: Float,
				velocidad :: Float,
				enamorade :: String,
				trucoEspecial :: Auto -> Auto
				} deriving Show

rochaMcQueen = Auto "RochaMcQueen" 300 0 "Ronco" deReversaRocha
biankerr = Auto "biankerr" 500 20 "Tinch" impresionar
gushtav = Auto "Gushtav" 200 130 "PetiLaLinda" nitro
rodra = Auto "Rodra" 0 50 "Taisa" (fingirAmor "petra")

metrosPista = 1000

deReversaRocha :: Auto -> Auto
deReversaRocha unAuto = unAuto {nivelNafta = nivelNafta unAuto + (metrosPista*1/5)}

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
comboLoco = nitro.deReversaRocha

queTrucazo :: String -> Auto -> Auto
queTrucazo unEnamorade = (incrementarVelocidad.fingirAmor unEnamorade)

naftaA0 :: Auto -> Auto
naftaA0 unAuto = unAuto {nivelNafta = 0}

multiplicaVelPor10SegunNafta :: Auto -> Auto
multiplicaVelPor10SegunNafta unAuto = unAuto {velocidad = velocidad unAuto + ((*10).(nivelNafta)) unAuto}

turbo :: Auto -> Auto
turbo = naftaA0.multiplicaVelPor10SegunNafta
