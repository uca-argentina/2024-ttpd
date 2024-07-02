Class {
	#name : #AInstantCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
AInstantCardTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: aMessage ] 
]

{ #category : #tests }
AInstantCardTest >> test_01_WhenAInstantCardIsAskedIfISPermanentThenTheAnswerIsFalse [

| aCard |
aCard := InstantCard new.
self deny: aCard isPermanent.
]

{ #category : #tests }
AInstantCardTest >> test_02_WhenAInstantCardTriesToPlayAsAPermanentCardThenAErrorIsRaised [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aInstantCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aInstantCard := InstantCard new.
	(aBoardGame getShipsPlaying at: 1) addCard: aInstantCard. 
	self
		should: [
		aBoardGame playPermanentCard: 3 toShipIndex: 1]
		raise: Error
		withMessage: 'You cant play a Instant Card as a permanent card'
]
