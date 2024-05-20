Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
WormHoleBox class >> inPlace: aPosition [ 
	^self new initializeInPlace: aPosition.
]

{ #category : #'as yet unclassified' }
WormHoleBox >> getPosition [
	^position.
]

{ #category : #initialization }
WormHoleBox >> initializeInPlace: aPosition [ 
	position := aPosition.
]

{ #category : #'as yet unclassified' }
WormHoleBox >> moveShipTo [
	^2.
]
