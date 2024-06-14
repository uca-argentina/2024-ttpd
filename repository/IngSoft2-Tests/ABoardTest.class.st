Class {
	#name : #ABoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
ABoardTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: aMessage ] 
]

{ #category : #tests }
ABoardTest >> testNewMethodForInitializationOfBoard_18 [

	| aBoard aParsecsList |
	aParsecsList := #(5 7 2).
	aBoard := Board withNumberOfBoxes: 100 withParsecArray: aParsecsList aParsecLength: 1000 andMaxDieResult: 40.
	self assert: aBoard getMaxDieResult equals: 40.
		

]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenFirstPositionIsAlwaysANoEffectoBox_12 [

	| aBoard boxDistributions anEffectManager boxes |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 40).
	boxDistributions add:
		(BoxDistribution of: HyperGravityBox withDistribution: 20).
	boxDistributions add:
		(BoxDistribution of: HyperJumpBox withDistribution: 60).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	self assert: ((aBoard boxes at: 1) isKindOf: NoEffectBox)
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedWithLessThan1BoxThenBoardInvalid [

	| boxDistributions anEffectManager boxes |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 0.
	self
		should: [ Board withBoxesArray: boxes ]
		raise: Error
		withMessage: 'A Board must have at least 1 box to be created'
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedWithLessThan1BoxThenBoardInvalid_19 [

	self
		should: [ Board withNumberOfBoxes: 0 withParsecArray: #(1 3 4) aParsecLength: 20 andMaxDieResult: 45 ]
		raise: Error
		withMessage: 'A Board must have at least 1 box to be created'
]

{ #category : #tests }
ABoardTest >> testWhenAShipLandsInABlackHoleBoxThenItsPositionIsUpdated_17 [

	| aBoard aShip anotherShip aCollectionOfShips boxDistributions anEffectManager boxes |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aBoard
		players: aCollectionOfShips
		playerTurn: 1
		withDiceResult: 82
		andLaps: 2.

	self assert: aShip getPosition equals: 83.
	self assert: aShip getLaps equals: 1
]

{ #category : #tests }
ABoardTest >> testWhenAShipPassToNextLapThenUpdateLapAndPosition_16 [

	| aBoard aShip anotherShip aCollectionOfShips boxDistributions anEffectManager boxes |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .	
	aBoard players: aCollectionOfShips playerTurn: 1 withDiceResult: 104 andLaps: 2.
	
	self assert: aShip getPosition equals: 5.
	
	self assert:  aShip getLaps equals: 2.
		

]

{ #category : #tests }
ABoardTest >> test_20_ABoardCanBeCreatedWithAnArrayOfBoxes [

	| aBoard aBoxesArray|
	aBoxesArray := OrderedCollection new.
	aBoxesArray add: (NoEffectBox inPlace: 1).
	aBoxesArray add: (NoEffectBox inPlace: 2).
	aBoxesArray add: (NoEffectBox inPlace: 3).
	aBoxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: aBoxesArray.
	self assert: aBoard boardSize equals: 4.
]

{ #category : #tests }
ABoardTest >> test_21_ABoardCanBeCreatedWithAnArrayOfBoxesDoneWithDistributions [

	| boxDistributions anEffectManager boxes aBoard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: AtomicBombBox withDistribution: 80).
	boxDistributions add:
		(BoxDistribution of: HyperGravityBox withDistribution: 20).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 50.
	aBoard := Board withBoxesArray: boxes.

	self assert: aBoard boardSize equals: 50
]
