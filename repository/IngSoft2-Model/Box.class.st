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
	^1
]

{ #category : #accessing }
Box >> place [
	^ place
]
