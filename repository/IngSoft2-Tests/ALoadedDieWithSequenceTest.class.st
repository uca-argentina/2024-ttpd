Class {
	#name : #ALoadedDieWithSequenceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
ALoadedDieWithSequenceTest >> should: aErrorBlock raise: anErrorClass withMessage: anErrorMessage [
	self
		should: aErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

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

{ #category : #tests }
ALoadedDieWithSequenceTest >> testALoadedDieOfNFacesReturnsASequenceFrom1ToNWhenThrown [

| aLoadedDieWithSequence aSequence|
aLoadedDieWithSequence := LoadedDieWithSequence of: 6.
aSequence := OrderedCollection new.
aSequence add: 1.
aSequence add: 2.
aSequence add: 3.
aSequence add: 4.
aSequence add: 5.
aSequence add: 6.
self assert: aLoadedDieWithSequence throw equals: aSequence.
]

{ #category : #tests }
ALoadedDieWithSequenceTest >> testALoadedDieWithSequenceCannotBeCreatedWithLessThan3Faces [

| aLoadedDieWithSequence |
self should: [aLoadedDieWithSequence := LoadedDieWithSequence of: 2] raise: Error withMessage: 'A Die cannot be createdWith less of 3 faces'.
]
