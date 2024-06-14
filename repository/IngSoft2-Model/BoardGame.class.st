Class {
	#name : #BoardGame,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfShips',
		'board',
		'dice',
		'laps',
		'playerTurn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BoardGame class >> withShip: aNumberOfShips withBoard: aBoard WithDice: aCollectionOfDice andwithNumberOfLaps: numberOfLaps [

	aNumberOfShips < 1 ifTrue: [  Error signal: 'A Board must have at least 1 ship to be created'  ].
	numberOfLaps < 2 ifTrue: [  Error signal: 'A Board must have at least 2 laps to be created'  ].

	^ self new
		  initializeWithShips: aNumberOfShips
		  whithBoard: aBoard
		  withDice: aCollectionOfDice
		  andwithNumberOfLaps: numberOfLaps
]

{ #category : #accessing }
BoardGame >> changeTurn: playerTurn [
|lastPlayer|
lastPlayer :=aCollectionOfShips size.

(playerTurn = lastPlayer) ifTrue: [ ^ 1 ] ifFalse: [^ playerTurn + 1 ].




]

{ #category : #'as yet unclassified' }
BoardGame >> getLapsToDo [
	^laps.
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
	laps := aNumberOfLaps.
	playerTurn := 1.
]

{ #category : #'as yet unclassified' }
BoardGame >> passTurn [
	(aCollectionOfShips at: playerTurn) skipTurn.
	playerTurn := self changeTurn: playerTurn 
]

{ #category : #'as yet unclassified' }
BoardGame >> playTurn [

	| dieResult |
	(aCollectionOfShips at: playerTurn) checkTurn ifTrue: [
		dieResult := (aCollectionOfShips at: playerTurn) throwDice: dice.
		board
			players: aCollectionOfShips
			playerTurn: playerTurn
			withDiceResult: dieResult
			andLaps: laps ].

	(aCollectionOfShips at: playerTurn) victory ifFalse: [
		playerTurn := self changeTurn: playerTurn ]
]

{ #category : #'as yet unclassified' }
BoardGame >> showRanking [
	| ships sortedShips |
	ships := aCollectionOfShips.
	sortedShips := ships asSortedCollection: [ :aShip :anotherShip |
		               aShip > anotherShip ].
	^sortedShips collect: [:sortedShip | ships indexOf: sortedShip]
]

{ #category : #'as yet unclassified' }
BoardGame >> winnerIs [
	|winner|
	winner :=aCollectionOfShips at:1.
	aCollectionOfShips do:[:ship| (ship getLaps >= winner getLaps )ifTrue: [ winner := ship ]].
 
	^ aCollectionOfShips indexOf: winner.
]
