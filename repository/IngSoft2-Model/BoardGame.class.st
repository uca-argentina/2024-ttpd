Class {
	#name : #BoardGame,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfShips'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BoardGame class >> withShip: aNumberOfShips [ 
	
	^self new initializeWithShip: aNumberOfShips.
]

{ #category : #initialization }
BoardGame >> initializeWithShip: aNumberOfShips [
	| number |
	number := aNumberOfShips.
	aCollectionOfShips := OrderedCollection new.
	[ number ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship inPosition: 0).
		number := number - 1.].
	^ aCollectionOfShips
]

{ #category : #accessing }
BoardGame >> start [
	(aCollectionOfShips size = 0)  ifTrue: [ ^false ] ifFalse: [ ^true ]
]
