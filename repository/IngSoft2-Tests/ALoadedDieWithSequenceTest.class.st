Class {
	#name : #ALoadedDieWithSequenceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ALoadedDieWithSequenceTest >> testALoadedDieOf4FacesReturnsASequenceFrom1To4WhenThrown [

| aLoadedDieWithSequence aSequence|
aLoadedDieWithSequence := LoadedDieWithSequence of: 4.
aSequence := OrderedCollection new.
aSequence add: 1.
aSequence add: 2.
aSequence add: 3.
aSequence add: 4.
self assert: aLoadedDieWithSequence throw equals: aSequence.
]

{ #category : #tests }
ALoadedDieWithSequenceTest >> testALoadedDieOf5FacesReturnsASequenceFrom1To5WhenThrown [

| aLoadedDieWithSequence aSequence|
aLoadedDieWithSequence := LoadedDieWithSequence of: 5.
aSequence := OrderedCollection new.
aSequence add: 1.
aSequence add: 2.
aSequence add: 3.
aSequence add: 4.
self deny: aLoadedDieWithSequence throw equals: aSequence.
]
