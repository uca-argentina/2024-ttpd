Class {
	#name : #LoadedDieWithSequence,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDieWithSequence class >> of: aNumberOfFaces [ 
	aNumberOfFaces < 3 ifTrue: [
		Error signal: 'A Die cannot be createdWith less of 3 faces' ].
	^self new initializeOf: aNumberOfFaces.
]

{ #category : #initialization }
LoadedDieWithSequence >> initializeOf: aNumberOfFaces [ 
	faces := aNumberOfFaces.
]

{ #category : #'as yet unclassified' }
LoadedDieWithSequence >> throw [

	| sequence numToAdd |
	sequence := OrderedCollection new.
	numToAdd := 1.
	[numToAdd <= faces] whileTrue: [
		sequence add: numToAdd.
		numToAdd := numToAdd + 1. ].
	^ sequence
]
