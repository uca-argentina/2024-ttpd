Class {
	#name : #AllyCard,
	#superclass : #PermanentCard,
	#instVars : [
		'ally'
	],
	#classInstVars : [
		'aCollectionOfAlly'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AllyCard class >> with: aShip [ 
	^self new initializeWith: aShip


]

{ #category : #'as yet unclassified' }
AllyCard >> aplyEffectFrom: aShip to: anotherShip withShips: aCollectionOfShips [

	| card1 card2 |
	card1 := AllyCard with: aShip.
	card2 := AllyCard with: anotherShip.

	aShip addActiveCards: card2.
	anotherShip addActiveCards: card1
]

{ #category : #'as yet unclassified' }
AllyCard >> getAlly [
	^ally
]

{ #category : #initialization }
AllyCard >> initializeWith: aShip [
	ally:=aShip.
]

{ #category : #'as yet unclassified' }
AllyCard >> powerMove [
^0.
]
