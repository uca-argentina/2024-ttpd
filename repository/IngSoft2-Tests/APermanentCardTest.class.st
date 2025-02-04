Class {
	#name : #APermanentCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
APermanentCardTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: aMessage ] 
]

{ #category : #running }
APermanentCardTest >> test_03_APermamentCardHasPowerMoveThenItReturnsZero [

	| aCard |
	aCard := PermanentCard new.
	self assert: aCard powerMove equals: 0
]

{ #category : #running }
APermanentCardTest >> test_04_APermanentCardCannotBePlayedAsAnIsntantCard [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard |
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
	aPermanentCard := PermanentCard new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard. 
	self
		should: [
		aBoardGame playInstantCard: 3 from: 1 toShipOrCardIndex: 2 ]
		raise: Error
		withMessage: 'You cant play a Permanent Card in any turn'
]

{ #category : #running }
APermanentCardTest >> test_05_WhenAPermanentCardIsAskedIfIsPermanentThenTheAnswerIsTrue [

	| aCard |
	aCard := PermanentCard new.
	self assert: aCard isPermanent.
]

{ #category : #running }
APermanentCardTest >> test_06_WhenAPermanentCardIsAskedIfIsInstatThenTheAnswerIsFalse [

	| aCard |
	aCard := PermanentCard new.
	self deny: aCard isInstant.
]
