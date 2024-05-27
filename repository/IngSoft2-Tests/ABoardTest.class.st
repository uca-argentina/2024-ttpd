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
ABoardTest >> testWhenABoardHas100BoxesThen2OfThemIsAtomicBomb_05 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 100.
	self assert: aBoard getAtomicBomb size equals: 2.
]

{ #category : #tests }
ABoardTest >> testWhenABoardHas10BoxesThen1OfThemAreMoonWalk_03 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: aBoard getMoonWalkBoxes size equals: 1.
]

{ #category : #tests }
ABoardTest >> testWhenABoardHas10BoxesThen2OfThemAreBlackHoles_01 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: aBoard getBlackHoleBoxes size equals: 2.
]

{ #category : #tests }
ABoardTest >> testWhenABoardHas10BoxesThen2OfThemAreHyperGravity_02 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: aBoard getHyperGravityBoxes size equals: 2.
]

{ #category : #tests }
ABoardTest >> testWhenABoardHas25BoxesThen2OfThemIsHyperJump_04 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 25.
	self assert: aBoard getHyperJumpBoxes size equals: 2.
]

{ #category : #tests }
ABoardTest >> testWhenABoardHasAWormHoleThenIsWormHoleAtPositionReturnsTrue [ 

	| aBoard |
	aBoard := Board
		          withNumberOfBoxes: 5
		          withWormHoleStaringIn: 3
		          andEndingIn: 4.
	self assert: (aBoard isWormHoleAt: 3) equals: true
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThen2OfItsBoxesAreWormHoleKind_13 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: aBoard getWormHolesBoxes size equals: 2.
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenFirstPositionIsAlwaysANoEffectoBox_12 [

	| aBoard|
	aBoard := Board withNumberOfBoxes: 100.
	self assert: ((aBoard boxes at: 1) isKindOf: NoEffectBox).
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenThePositionOfTheBlackHoleBoxesVanBeShown_06 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: ((aBoard getBlackHoleBoxes at: 1) getPosition between: 1 and: 10).
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenThePositionOfTheMoonWalkBoxesCanBeShown_07 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: ((aBoard getMoonWalkBoxes at: 1) getPosition between: 1 and: 10).
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenThePositionsOfDiferentBoxesShouldBeDiferent_11 [

	| aBoard positionAtomicBombBox positionBlackHoleBox |
	aBoard := Board withNumberOfBoxes: 100.
	positionAtomicBombBox := (aBoard getAtomicBomb at: 1) getPosition.
	positionBlackHoleBox := (aBoard getBlackHoleBoxes at: 1) getPosition.
	self deny: positionAtomicBombBox = positionBlackHoleBox.
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenThePositionsOfTheAtomicBombBoxesCanBeShown_10 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 100.
	self assert: ((aBoard getAtomicBomb at: 1) getPosition between: 1 and: 100).
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenThePositionsOfTheHyperGravityBoxesCanBeShown_08 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: ((aBoard getHyperGravityBoxes at: 1) getPosition between: 1 and: 10).
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenThePositionsOfTheHyperJumpBoxesCanBeShown_09 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 100.
	self assert: ((aBoard getHyperJumpBoxes at: 1) getPosition between: 1 and: 100).
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedWith5BoxesThenBoardIsValid [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 100.
	self assert: aBoard hasBoxes equals: 100
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedWithAWormHoleStartingPostition0ThenBoardIsNotCreated [

	self
		should: [
		Board withNumberOfBoxes: 5 withWormHoleStaringIn: 0 andEndingIn: 3 ]
		raise: Error
		withMessage: 'A WormHole must Start in box 1 or more'
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedWithLessThan1BoxThenBoardInvalid [

	self
		should: [ Board withNumberOfBoxes: 0 ]
		raise: Error
		withMessage: 'A Board must have at least 1 box to be created'
]

{ #category : #tests }
ABoardTest >> testWhenTheEndingPositionOfTheHoleIsBiggerThanNumberOfBoxesThenBoardNotCreated [

	self
		should: [
		Board withNumberOfBoxes: 5 withWormHoleStaringIn: 1 andEndingIn: 6 ]
		raise: Error
		withMessage:
		'The ending position of the wormHole must be lower than the number of boxes of the board'
]
