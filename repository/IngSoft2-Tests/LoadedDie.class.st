Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDie class >> of: anAmountOfFaces [

	anAmountOfFaces < 2 ifTrue: [
		Error signal: 'Faces should be more than 1' ].
	^ self new initializeOf: anAmountOfFaces
]

{ #category : #initialization }
LoadedDie >> initializeOf: anAmountOfFaces [
	faces:=  anAmountOfFaces.
]

{ #category : #'as yet unclassified' }
LoadedDie >> throw [

	^ faces
]
