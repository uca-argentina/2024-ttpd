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

{ #category : #accessing }
BoardGame >> getPositionOfShipAt: anIndexOfShip [ 
	| position |
	position:= ( aCollectionOfShips at: anIndexOfShip) getPosition.
	
	^position.


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
	laps := aNumberOfLaps
]

{ #category : #'as yet unclassified' }
BoardGame >> showRanking [

	| ranking firstThree winner second third |
	ranking := SortedCollection sortBlock: [ :aShip :anotherShip |
		           aShip getLaps = anotherShip getLaps
			           ifTrue: [ aShip getPosition > anotherShip getPosition ]
			           ifFalse: [ aShip getLaps > anotherShip getLaps ] ].
	aCollectionOfShips do: [ :ship | ranking add: ship ].
	winner := aCollectionOfShips indexOf: (ranking at: 1).
	second := aCollectionOfShips indexOf: (ranking at: 2).
	third := aCollectionOfShips indexOf: (ranking at: 3).
	firstThree := OrderedCollection new.
	firstThree add: winner.
	firstThree add: second.
	firstThree add: third.
	^ firstThree
]

{ #category : #accessing }
BoardGame >> start [

	| playerTurn play dieResult |
	playerTurn := 1.
	play := (aCollectionOfShips at: playerTurn) victory.

	[ play ] whileFalse: [
	"preguntar si va a tirar"
		((aCollectionOfShips at: playerTurn) checkTurn) ifTrue: [   
		dieResult := (aCollectionOfShips at: playerTurn) throwDice: dice.
		board
			 players: aCollectionOfShips playerTurn: playerTurn withDiceResult: dieResult andLaps: laps.
		].
		"cant play
		salteo turno
		gravity"	
			"metodo q resuelva"
		play := (aCollectionOfShips at: playerTurn) victory.
		playerTurn := self changeTurn: playerTurn. ].

	^ play
]

{ #category : #'as yet unclassified' }
BoardGame >> winnerIs [
	|winner|
	winner :=aCollectionOfShips at:1.
	aCollectionOfShips do:[:ship| (ship getLaps >= winner getLaps )ifTrue: [ winner := ship ]].
 
	^ aCollectionOfShips indexOf: winner.
]
