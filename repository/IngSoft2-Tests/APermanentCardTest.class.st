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
APermanentCardTest >> test_01_OveroadCardCreated [ 

| aCard |
aCard:= OverloadCard new.
self assert: (aCard isKindOf: OverloadCard).
]

{ #category : #running }
APermanentCardTest >> test_02_AcceleartionCardCreated [ 

| aCard |
aCard:= AccelerationCard new.
self assert: (aCard isKindOf: AccelerationCard).
]

{ #category : #running }
APermanentCardTest >> test_03_APermamentCardHasPowerMoveThenItReturnsZero [

	| aCard |
	aCard := PermanentCard new.
	self assert: aCard powerMove equals: 0
]

{ #category : #running }
APermanentCardTest >> test_04_APermanentCardCannotBePlayedAsAnIsntantCard [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aPermanentCard |
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
	aPermanentCard := PermanentCard new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard. 
	self
		should: [
		aBoardGame playInstantCard: 3 from: 1 toShip: 2 ]
		raise: Error
		withMessage: 'You cant play a Permanent Card in any turn'
]
