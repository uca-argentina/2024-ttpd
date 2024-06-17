Class {
	#name : 'AParsectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AParsectTest >> test_01_AParsecLenghtCanBeSet [

| aParsec |
aParsec:=Parsec new.
aParsec lenght:20.

self assert:aParsec getLeght equals:20.

]

{ #category : 'running' }
AParsectTest >> test_02_ParsecNotAffectedByConvertToParsec [ 

| aParsec |
aParsec:=Parsec new.
aParsec lenght:20.

self assert:aParsec convertToParsec equals:20.

]

{ #category : 'running' }
AParsectTest >> test_03_PasecLenghtConvertToLightYearLenght [ 

| aParsec |
aParsec:=Parsec new.
aParsec lenght:20.

self assert:aParsec convertToLightYear equals:60.

]
