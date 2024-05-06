Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> of: anAmountOfFaces [ 
	^ self new initializeOf: anAmountOfFaces
]

{ #category : #initialization }
Die >> initializeOf: anAmountOfFaces [
	faces:=  anAmountOfFaces.
]

{ #category : #'as yet unclassified' }
Die >> throw [

	^ faces
]
