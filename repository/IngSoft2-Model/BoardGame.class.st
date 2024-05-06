Class {
	#name : #BoardGame,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfShips',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BoardGame class >> withShip: aNumberOfShips [ 
	
	^self new initializeWithShip: aNumberOfShips.
]

{ #category : #'as yet unclassified' }
BoardGame class >> withShip: aNumberOfShips andBoard: aBoard [ 
	^self new initializeWithANumberOfShips: aNumberOfShips andBoard: aBoard.
]

{ #category : #initialization }
BoardGame >> initializeWithANumberOfShips: aNumberOfShips andBoard: aBoard [ 
	| numberOfShips |
	numberOfShips := aNumberOfShips.
	numberOfShips < 1 ifTrue: [ Error signal: 'A Board Game should have at least 1 ship to start' ]. 
	aCollectionOfShips := OrderedCollection new.
	[ numberOfShips ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship inPosition: 0).
		numberOfShips := numberOfShips - 1.].
	board := aBoard. 
]

{ #category : #initialization }
BoardGame >> initializeWithShip: aNumberOfShips [
	| number |
	number := aNumberOfShips.
	number < 1 ifTrue: [ Error signal: 'A Board Game should have at least 1 ship to start' ]. 
	aCollectionOfShips := OrderedCollection new.
	[ number ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship inPosition: 0).
		number := number - 1.].
]

{ #category : #accessing }
BoardGame >> start [
	(aCollectionOfShips size = 0)  ifTrue: [ ^false ] ifFalse: [ ^true ]
]

{ #category : #'as yet unclassified' }
BoardGame >> withBoard: aBoard [ 
	self shouldBeImplemented.
]
