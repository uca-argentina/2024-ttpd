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
BoardGame >> CutIfSomeoneWin [

	1 to: aCollectionOfShips size do:[:i | |ship| ship:=aCollectionOfShips at:i. (ship getPosition >= board hasBoxes) ifTrue: [ ^false] ].
	^true
]

{ #category : #accessing }
BoardGame >> CutIfSomeoneWin: playerTurn [

	^ (aCollectionOfShips at: playerTurn) getPosition >= board hasBoxes
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
BoardGame >> start [

	| playerTurn lastPlayer positionToMove |
	lastPlayer := aCollectionOfShips size.
	playerTurn := 1.

	[ self CutIfSomeoneWin: playerTurn ] whileFalse: [
		positionToMove := (aCollectionOfShips at: playerTurn) throwDice:
			                  dice.
		(aCollectionOfShips at: playerTurn) moves: positionToMove.
		playerTurn = lastPlayer
			ifTrue: [ playerTurn := 1 ]
			ifFalse: [ playerTurn := playerTurn + 1 ] ].


	^self CutIfSomeoneWin: playerTurn
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
