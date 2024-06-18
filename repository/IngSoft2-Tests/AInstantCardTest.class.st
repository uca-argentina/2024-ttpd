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

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aInstantCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
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
		aBoardGame playPermanentCard: 3 toShipIndex: 1 inShipCollection:  (aBoardGame getShipsPlaying)]
		raise: Error
		withMessage: 'You cant play a Instant Card as a permanent card'
]
