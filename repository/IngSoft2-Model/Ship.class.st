Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'fuel',
		'maxFuel',
		'laps',
		'state',
		'lastDieResult',
		'aCollectionOfCards',
		'aCollectionOfActiveCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> create [
	^self new initializeShip.
]

{ #category : 'as yet unclassified' }
Ship class >> createWithMaxFuel: maxFuel [ 
	^self new intitializeWithMaxFuel: maxFuel.
]

{ #category : 'comparing' }
Ship >> > anotherShip [

	self getLaps = anotherShip getLaps ifTrue: [
		^ self getPosition > anotherShip getPosition ].
	^ self getLaps > anotherShip getLaps
]

{ #category : 'adding' }
Ship >> addActiveCards: aCard [
	aCollectionOfActiveCards add:aCard
]

{ #category : 'adding' }
Ship >> addCard: aCard [ 
	aCollectionOfCards add: aCard.
]

{ #category : 'as yet unclassified' }
Ship >> browseActiveCards [
	aCollectionOfActiveCards do:[:aCard|  self moves: (aCard powerMove)]. 
]

{ #category : 'as yet unclassified' }
Ship >> changeStateToPlay [
	state := Playing new.
]

{ #category : 'as yet unclassified' }
Ship >> checkIfWin: aNumberOfLaps [ 
	laps >= aNumberOfLaps ifTrue: [state:=Winner new].
]

{ #category : 'as yet unclassified' }
Ship >> checkTurn [
	^state checkTurnState: self.
]

{ #category : 'as yet unclassified' }
Ship >> consumeFuel: amount [

	fuel - amount > 0
		ifTrue: [ fuel := fuel - amount ]
		ifFalse: [
			fuel := maxFuel.
			position := 1.
			state := CantPlayANumberOfTurns skip: 2 ]
]

{ #category : 'as yet unclassified' }
Ship >> decreaseLaps [
	laps := laps - 1.
]

{ #category : 'as yet unclassified' }
Ship >> endCursed [
	state := Playing new.
	self moves: lastDieResult.
	self consumeFuel: lastDieResult.
]

{ #category : 'as yet unclassified' }
Ship >> getActiveCards [
	^aCollectionOfActiveCards 
]

{ #category : 'as yet unclassified' }
Ship >> getCards [
	^aCollectionOfCards 
]

{ #category : 'as yet unclassified' }
Ship >> getFuel [
	^fuel
]

{ #category : 'as yet unclassified' }
Ship >> getLaps [
	^laps
]

{ #category : 'as yet unclassified' }
Ship >> getLastDieResult [
	^lastDieResult.
]

{ #category : 'as yet unclassified' }
Ship >> getPosition [
	^position.
]

{ #category : 'as yet unclassified' }
Ship >> getState [
	^state.
]

{ #category : 'as yet unclassified' }
Ship >> initializeShip [

	position := 0.
	fuel := 100
]

{ #category : 'as yet unclassified' }
Ship >> intitializeWithMaxFuel: amountMaxFuel [ 
	| aCard anotherCard |
	position:= 1.
	fuel:= amountMaxFuel.
	maxFuel:= amountMaxFuel.
	laps:= 1.
	state := Playing new.
	lastDieResult := 0.
	aCollectionOfCards :=OrderedCollection new.
	aCard:= OverloadCard new.
	anotherCard:=AccelerationCard new.
	aCollectionOfCards add: aCard.
	aCollectionOfCards add: anotherCard .
	aCollectionOfActiveCards:=OrderedCollection new.
]

{ #category : 'testing' }
Ship >> isCursed [
	state := Jail new.
]

{ #category : 'as yet unclassified' }
Ship >> moves: aNumber [
	position := position + aNumber.
	^(position).
]

{ #category : 'as yet unclassified' }
Ship >> movesTo: aPosition [ 
	position := aPosition.
]

{ #category : 'as yet unclassified' }
Ship >> restartFuel [
	fuel:= maxFuel .
]

{ #category : 'as yet unclassified' }
Ship >> selectCard [
	| aCard |
	aCard:= aCollectionOfCards at:1.
	aCollectionOfCards removeFirst.
	^aCard.
]

{ #category : 'as yet unclassified' }
Ship >> skipTurn [
	state := CantPlayANumberOfTurns skip: 1.
	fuel := maxFuel.
]

{ #category : 'as yet unclassified' }
Ship >> throwDice: aCollectionOfDice [ 
	| positionsToMove |
	positionsToMove := 0.
	aCollectionOfDice do: [ :die |
	 positionsToMove := positionsToMove + (die throw). ].
	lastDieResult := positionsToMove.	
	^positionsToMove.
]

{ #category : 'as yet unclassified' }
Ship >> updateLaps [
	laps := laps + 1.
]

{ #category : 'as yet unclassified' }
Ship >> updateStateToWinner [
	state:=Winner new.
]

{ #category : 'as yet unclassified' }
Ship >> victory [
	^state checkPlay.
]
