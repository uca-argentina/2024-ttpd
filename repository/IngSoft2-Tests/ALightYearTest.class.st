Class {
	#name : #ALightYearTest,
	#superclass : #TestCase,
	#category : 'IngSoft2-Tests'
}

{ #category : #running }
ALightYearTest >> test_01_ALightYearLenghtIsSet [

| aLightYear |
aLightYear :=LightYear new.
aLightYear lenght:20.

self assert: aLightYear getLeght equals:20.
]

{ #category : #running }
ALightYearTest >> test_02_LighYearConvertToParsecLenght [

| aLightYear |
aLightYear :=LightYear new.
aLightYear lenght:20.

self assert: aLightYear convertToParsec equals:(20/3).

]
