Class {
	#name : #BoardGame,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfShips',
		'board',
		'dice',
		'laps',
		'playerTurn',
		'aCollectionOfCards',
		'maxDieResult',
		'lastCard'
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

{ #category : #adding }
BoardGame >> addHyperGravityInformationTo: aBox withDieResult: aDieResult [ 
	aBox setNumber: aDieResult .
]

{ #category : #'as yet unclassified' }
BoardGame >> addHyperJumpInformationTo: aBox withParsecList: aParsecList withParsecLenght: aParsecLenght [

	aBox addParsecsList: aParsecList withBoardLenght: board boardSize andParsecLength: aParsecLenght
]

{ #category : #adding }
BoardGame >> addMoonWalkInformationTo: aBox withBoxesNumber: aNumberOfBoxesToMove [ 
	aBox numberOfBoxesToMove: aNumberOfBoxesToMove.
]

{ #category : #accessing }
BoardGame >> changeTurn: playerTurn [
|lastPlayer|
lastPlayer :=aCollectionOfShips size.

(playerTurn = lastPlayer) ifTrue: [ ^ 1 ] ifFalse: [^ playerTurn + 1 ].




]

{ #category : #'as yet unclassified' }
BoardGame >> getBoard [

	^board.
]

{ #category : #'as yet unclassified' }
BoardGame >> getCards [
^aCollectionOfCards.
]

{ #category : #'as yet unclassified' }
BoardGame >> getLapsToDo [
	^laps.
]

{ #category : #'as yet unclassified' }
BoardGame >> getLastCard [
	^lastCard.
]

{ #category : #'as yet unclassified' }
BoardGame >> getMaxDieResult [
	^maxDieResult.
]

{ #category : #'as yet unclassified' }
BoardGame >> getShipsPlaying [
	^aCollectionOfShips
]

{ #category : #initialization }
BoardGame >> initializeWithShips: aNumberOfShips whithBoard: aBoard withDice: aCollectionOfDice andwithNumberOfLaps: aNumberOfLaps [

	| numberOfShips numberOfBoxes maxFuel aShip aCardManager|
	numberOfShips := aNumberOfShips.
	numberOfBoxes := aBoard.
	maxFuel := 0.
	aCollectionOfDice do: [ :die | maxFuel := maxFuel + die maximumValue ].
	maxDieResult := maxFuel.
	maxFuel := maxFuel * 2.
	aCollectionOfShips := OrderedCollection new.
	aCardManager:= CardsManager new.
	[ numberOfShips ~= 0 ] whileTrue: [
		aShip := Ship createWithMaxFuel: maxFuel.
		aShip addCard: aCardManager createACard.
		aShip addCard: aCardManager createACard.
		aCollectionOfShips add: aShip.
		numberOfShips := numberOfShips - 1 ].
	board := aBoard.
	dice := aCollectionOfDice.
	laps := aNumberOfLaps.
	playerTurn := 1.
	aCollectionOfCards := OrderedCollection new
]

{ #category : #'as yet unclassified' }
BoardGame >> passTurn [
	(aCollectionOfShips at: playerTurn) skipTurn.
	playerTurn := self changeTurn: playerTurn 
]

{ #category : #'as yet unclassified' }
BoardGame >> playCard: cardToPlay [
	| aCard |
	aCard:= (aCollectionOfShips at: playerTurn) selectCard: cardToPlay.
	(aCollectionOfShips at: playerTurn) addActiveCards: aCard.
	(aCollectionOfShips at: playerTurn) removeCardFromHand: aCard.
	aCollectionOfCards add:aCard.
	
	
]

{ #category : #'as yet unclassified' }
BoardGame >> playInstantCard: aCardIndex from: aShipIndex toShip: anotherShipIndex [
	| shipPlayingCard |
	shipPlayingCard := aCollectionOfShips at: aShipIndex. 
	lastCard := shipPlayingCard playInstantCard: aCardIndex to: anotherShipIndex playing: self.
]

{ #category : #'as yet unclassified' }
BoardGame >> playPermanentCard: aCardIndex toShipIndex: aShipIndex inShipCollection: shipsPlaying [ 
	lastCard := (aCollectionOfShips at: playerTurn) playPermanentCard: aCardIndex to: aShipIndex playing: shipsPlaying.
]

{ #category : #'as yet unclassified' }
BoardGame >> playRedoCard: aCardIndex fromShip: aShipFromIndex toShipOrCardIndex: toShipOrCardIndex [

	| cardIndex |
	(aCollectionOfShips at: playerTurn) addCard: lastCard.
	cardIndex := (aCollectionOfShips at: playerTurn) getCards size.
	lastCard isPermanent
		ifTrue: [
			self
				playPermanentCard: cardIndex
				toShipIndex: toShipOrCardIndex
				inShipCollection: aCollectionOfShips ]
		ifFalse: [
			self
				playInstantCard: cardIndex
				from: aShipFromIndex
				toShip: toShipOrCardIndex ]
]

{ #category : #'as yet unclassified' }
BoardGame >> playTurn [

	| dieResult |
	(aCollectionOfShips at: playerTurn) checkTurn ifTrue: [
		dieResult := (aCollectionOfShips at: playerTurn) throwDice: dice.
		(aCollectionOfShips at: playerTurn) checkReward: dieResult withMax: maxDieResult.
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
