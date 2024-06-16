Class {
	#name : 'AllyCard',
	#superclass : 'PermanentCard',
	#instVars : [
		'ally'
	],
	#classInstVars : [
		'aCollectionOfAlly'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
AllyCard class >> with: aShip [ 
	^self new initializeWith: aShip


]

{ #category : 'as yet unclassified' }
AllyCard >> aplyEffectFrom: aShipIndex to: anotherShipIndex withShips: aCollectionOfShips [

	| card1 card2 |
	card1 := AllyCard with: (aCollectionOfShips at: aShipIndex).
	card2 := AllyCard with: (aCollectionOfShips at: anotherShipIndex).

	(aCollectionOfShips at: aShipIndex) addActiveCards: card2.
	(aCollectionOfShips at: anotherShipIndex) addActiveCards: card1
]

{ #category : 'as yet unclassified' }
AllyCard >> getAlly [
	^ally
]

{ #category : 'initialization' }
AllyCard >> initializeWith: aShip [
	ally:=aShip.
]

{ #category : 'as yet unclassified' }
AllyCard >> powerMove [
^0.
]
