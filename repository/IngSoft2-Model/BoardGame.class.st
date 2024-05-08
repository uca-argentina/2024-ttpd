Class {
	#name : #BoardGame,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfShips',
		'board',
		'dice',
		'aCollectionOfBoxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BoardGame class >> withShip: aNumberOfShips [ 
	
	^self new initializeWithShip: aNumberOfShips.
]

{ #category : #'as yet unclassified' }
BoardGame class >> withShip: aNumberOfShips andBoard: aBoard [ 
	aNumberOfShips < 1 ifTrue: [ Error signal: 'A Board Game should have at least 1 ship to start' ]. 
	^self new initializeWithANumberOfShips: aNumberOfShips andBoard: aBoard.
]

{ #category : #'as yet unclassified' }
BoardGame class >> withShip: aNumberOfShips withBoard: aBoard andWithDice: aCollectionOfDice [

	aNumberOfShips < 1 ifTrue: [
		Error signal: 'A Board Game should have at least 1 ship to start' ].
	^ self new
		  initializeWithANumberOfShips: aNumberOfShips
		  withBoard: aBoard
		  andWithDice: aCollectionOfDice
]

{ #category : #accessing }
BoardGame >> changeTurn: playerTurn [
|lastPlayer|
lastPlayer :=aCollectionOfShips size.

(playerTurn = lastPlayer) ifTrue: [ ^ 1 ] ifFalse: [^ playerTurn + 1 ].




]

{ #category : #accessing }
BoardGame >> cutIfSomeoneWin [

	1 to: aCollectionOfShips size do:[:i | |ship| ship:=(aCollectionOfShips at:i). (ship getPosition >= board hasBoxes) ifTrue: [ ^true] ].
	^false
]

{ #category : #initialization }
BoardGame >> initializeWithANumberOfShips: aNumberOfShips andBoard: aBoard [ 
	| numberOfShips |
	numberOfShips := aNumberOfShips.
	aCollectionOfShips := OrderedCollection new.
	[ numberOfShips ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship inPosition: 0).
		numberOfShips := numberOfShips - 1.].
	board := aBoard. 
]

{ #category : #initialization }
BoardGame >> initializeWithANumberOfShips: aNumberOfShips withBoard: aBoard andWithDice: aCollectionOfDice [

	| numberOfShips numberOfBoxes |
	numberOfShips := aNumberOfShips.
	numberOfBoxes := aBoard.
	aCollectionOfShips := OrderedCollection new.
	[ numberOfShips ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship inPosition: 0).
		numberOfShips := numberOfShips - 1 ].
	board:= aBoard.
	dice := aCollectionOfDice
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
BoardGame >> movesShipInTheBoard: playerTurn [

	| positionToMove actualPosition ship |
	ship := aCollectionOfShips at: playerTurn.
	positionToMove := ship throwDice: dice.
	actualPosition := (aCollectionOfShips at: playerTurn) moves:
		                  positionToMove.

	(board hasWormHole indexOf: actualPosition) ~= 0 ifTrue: [
		(board exitWormHole = actualPosition)ifTrue: [ship initializeInPosition: board inputWormHole]  ifFalse: [ ship initializeInPosition: board exitWormHole  ]
		 ]
]

{ #category : #accessing }
BoardGame >> start [

	| playerTurn |

	playerTurn := 1.

[ self cutIfSomeoneWin ] whileFalse:  [
    (self movesShipInTheBoard: playerTurn).
	(playerTurn:=(self changeTurn:playerTurn)).
    
].

	^self cutIfSomeoneWin 


]

{ #category : #'as yet unclassified' }
BoardGame >> winnerIs [
	|winner|
	winner :=aCollectionOfShips at:1.
	
	2 to: aCollectionOfShips size do:[:i | |shipActual| shipActual:= aCollectionOfShips at: i.
		(winner getPosition < shipActual getPosition)ifTrue: [ winner :=shipActual]
		]. 
	^ aCollectionOfShips indexOf: winner.
]
