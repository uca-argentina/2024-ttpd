Class {
	#name : 'Box',
	#superclass : 'Object',
	#instVars : [
		'place',
		'ships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
Box class >> create [
	^self new initializeBox.
]

{ #category : 'as yet unclassified' }
Box class >> inPlace: aPlace [ 
	aPlace < 1 ifTrue: [ Error signal: 'The position of the box must be greater or equal to 1' ].
	^self new initializeInPlace: aPlace.
]

{ #category : 'as yet unclassified' }
Box class >> withShips: aCollectionOfShips [ 
	^self new initializeWithShips: aCollectionOfShips.
]

{ #category : 'adding' }
Box >> addShip: aShip [

	ships add: aShip
]

{ #category : 'as yet unclassified' }
Box >> effectShips: aCollectionOfShips playing: aShip [ 
	
]

{ #category : 'as yet unclassified' }
Box >> effectsOn [

	^0
]

{ #category : 'as yet unclassified' }
Box >> getPosition [
	^place.
]

{ #category : 'as yet unclassified' }
Box >> getShips [
	^ships.
]

{ #category : 'initialization' }
Box >> initializeBox [

	ships := OrderedCollection new
]

{ #category : 'initialization' }
Box >> initializeInPlace: aPlace [
	place := aPlace.
	
]

{ #category : 'initialization' }
Box >> initializeWithShips: aCollectionOfShips [ 
	ships := aCollectionOfShips
]

{ #category : 'removing' }
Box >> removeShip: aShip [ 
	ships remove: aShip ifAbsent: [ ]
]
