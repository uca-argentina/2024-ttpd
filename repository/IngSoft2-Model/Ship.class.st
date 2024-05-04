Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Ship class >> inPosition: aPosition [ 
	^self new initializeInPosition: aPosition.
]

{ #category : #initialization }
Ship >> initializeInPosition: aPosition [ 
	position := aPosition.
]

{ #category : #'as yet unclassified' }
Ship >> moves: aNumber [
	^aNumber.
]
