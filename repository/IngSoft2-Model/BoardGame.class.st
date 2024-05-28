Class {
	#name : #BoardGame,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfShips',
		'board',
		'dice',
		'laps'
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
BoardGame class >> withShip: aNumberOfShips withBoard: aBoard WithDice: aCollectionOfDice andwithNumberOfLaps: numberOfLaps [

	^ self new
		  initializeWithShips: aNumberOfShips
		  whithBoard: aBoard
		  withDice: aCollectionOfDice
		  andwithNumberOfLaps: numberOfLaps
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

{ #category : #'as yet unclassified' }
BoardGame >> cutIfSomeoneWin: playerTurn [

	^(aCollectionOfShips at: playerTurn) getPosition >= board hasBoxes.

]

{ #category : #'as yet unclassified' }
BoardGame >> cutIfSomeoneWinparttwo: playerTurn [

	^(aCollectionOfShips at: playerTurn) getLaps  >= laps.

]

{ #category : #'as yet unclassified' }
BoardGame >> getLapsToDo [
	^laps.
]

{ #category : #accessing }
BoardGame >> getPositionOfShipAt: anIndexOfShip [ 
	| position |
	position:= ( aCollectionOfShips at: anIndexOfShip) getPosition.
	
	^position.


]

{ #category : #initialization }
BoardGame >> initializeWithANumberOfShips: aNumberOfShips withBoard: aBoard andWithDice: aCollectionOfDice [

	| numberOfShips numberOfBoxes |
	numberOfShips := aNumberOfShips.
	numberOfBoxes := aBoard.
	aCollectionOfShips := OrderedCollection new.
	[ numberOfShips ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship create).
		numberOfShips := numberOfShips - 1 ].
	board:= aBoard.
	dice := aCollectionOfDice
]

{ #category : #initialization }
BoardGame >> initializeWithShips: aNumberOfShips whithBoard: aBoard withDice: aCollectionOfDice andwithNumberOfLaps: aNumberOfLaps [

	| numberOfShips numberOfBoxes maxFuel |
	numberOfShips := aNumberOfShips.
	numberOfBoxes := aBoard.
	maxFuel := 0.
	aCollectionOfDice do: [ :die | maxFuel := maxFuel + die maximumValue ].
	maxFuel := maxFuel * 2.
	aCollectionOfShips := OrderedCollection new.
	[ numberOfShips ~= 0 ] whileTrue: [
		aCollectionOfShips add: (Ship createWithMaxFuel: maxFuel).
		numberOfShips := numberOfShips - 1 ].
	board := aBoard.
	dice := aCollectionOfDice.
	laps:= aNumberOfLaps.
]

{ #category : #accessing }
BoardGame >> start [

	| playerTurn play |
	playerTurn := 1.
	play := self cutIfSomeoneWin: playerTurn .

	[ play ] whileFalse: [
		board
			move: (aCollectionOfShips at: playerTurn)
			withDiceResult:
			((aCollectionOfShips at: playerTurn) throwDice: dice).
		play := self cutIfSomeoneWin: playerTurn.
		playerTurn := self changeTurn: playerTurn ].

	^ self cutIfSomeoneWin
]

{ #category : #accessing }
BoardGame >> startparttwo [

	| playerTurn play |
	playerTurn := 1.
	play := self cutIfSomeoneWinparttwo:  playerTurn .

	[ play ] whileFalse: [
		board
			move: (aCollectionOfShips at: playerTurn)
			withDiceResult:
			((aCollectionOfShips at: playerTurn) throwDice: dice).
		play := self cutIfSomeoneWinparttwo:   playerTurn.
		playerTurn := self changeTurn: playerTurn ].

	^ play 
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

{ #category : #'as yet unclassified' }
BoardGame >> winnerIsParttwo [
	|winner|
	winner :=aCollectionOfShips at:1.
	aCollectionOfShips do:[:ship| (ship getLaps >= winner getLaps )ifTrue: [ winner := ship ]].
 
	^ aCollectionOfShips indexOf: winner.
]
