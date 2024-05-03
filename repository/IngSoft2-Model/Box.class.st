Class {
	#name : #Box,
	#superclass : #Object,
	#instVars : [
		'place'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Box class >> inPlace: aPlace [ 
	^self new initializeInPlace: aPlace.
]

{ #category : #initialization }
Box >> initializeInPlace: aPlace [
	place := aPlace.
]

{ #category : #accessing }
Box >> place [
	^ place
]
