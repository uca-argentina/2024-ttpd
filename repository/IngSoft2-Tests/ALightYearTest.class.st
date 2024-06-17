Class {
	#name : 'ALightYearTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
ALightYearTest >> test_01_ALightYearLenghtIsSet [

| aLightYear |
aLightYear :=LightYear new.
aLightYear lenght:20.

self assert: aLightYear getLeght equals:20.
]
