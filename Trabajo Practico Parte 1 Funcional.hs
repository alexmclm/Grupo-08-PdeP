-- Trabajo Practico Parte 1 Funcional

{-# LANGUAGE NoMonomorphismRestriction #-}
import Data.List -- para los metodos coleccionables que no vienen en la guia de lenguaje
import Data.Maybe -- por si llegan a usar un metodo de coleccion y devuelva Nothing or justElements
import Text.Show.Functions -- 
-- import Test.Hspec -- para usar los test


-- PUNTO 1

data Auto = Auto {
				nombre :: String,
				nivelNafta :: Float,
				velocidad :: Int,
				enamorade :: String,
				trucoEspecial :: Auto -> Auto 
				} deriving Show

rochaMcQueen = Auto "RochaMcQueen" 300 0    "Ronco" 		deReversaRocha
biankerr = Auto "biankerr" 500 		  20 	 "Tinch" 		impresionar
gushtav = Auto "Gushtav" 200 		  130 	"PetiLaLinda"	nitro
-- rodra = Auto "Rodra" 0 				  50 	"Taisa" 	   fingirAmor  -- ver "mas adelante " como lo dice el tp, pero es una funcion


deReversaRocha unAuto = unAuto {nivelNafta = nivelNafta unAuto + (1000*1/5)   }

impresionar :: Auto -> Auto
impresionar unAuto =  unAuto {velocidad =  velocidad unAuto *2}

nitro :: Auto -> Auto
nitro unAuto = unAuto {velocidad = velocidad unAuto + 15 }

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

--incrementarVelocidad :: Auto -> Auto
-- incrementarVelocidad unAuto | between (1 2 (vocalesDelEnamorade unAuto)) = unAuto {velocidad = velocidad unAuto + 15} me chilla por que repito funcion
-- 						 | otherwise = unAuto

-- PUNTO 3

-- PUNTO 4
comboLoco = nitro.deReversaRocha
-- queTrucazo = incrementarVelocidad.(fingirAmor otroEnamorade)+
