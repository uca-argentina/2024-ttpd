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
