Class {
	#name : #Box,
	#superclass : #Object,
	#instVars : [
		'place',
		'ships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Box class >> inPlace: aPlace [ 
	aPlace < 1 ifTrue: [ Error signal: 'The position of the box must be greater or equal to 1' ].
	^self new initializeInPlace: aPlace.
]

{ #category : #'as yet unclassified' }
Box class >> withShips: aCollectionOfShips [ 
	^self new initializeWithShips: aCollectionOfShips.
]

{ #category : #'as yet unclassified' }
Box >> getPosition [
	^place.
]

{ #category : #'as yet unclassified' }
Box >> getShips [
	^ships.
]

{ #category : #initialization }
Box >> initializeInPlace: aPlace [
	place := aPlace.
]

{ #category : #initialization }
Box >> initializeWithShips: aCollectionOfShips [ 
	ships := aCollectionOfShips
]

{ #category : #'as yet unclassified' }
Box >> moveShipTo [
	^place
]

{ #category : #accessing }
Box >> place [
	^ place
]
