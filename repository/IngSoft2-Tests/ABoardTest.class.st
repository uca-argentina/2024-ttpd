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
ABoardTest >> testWhenABoardHas10BoxesThen2OfThemAreBlackHoles_01 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: aBoard getBlackHoleBoxes equals: 2.
]

{ #category : #tests }
ABoardTest >> testWhenABoardHas10BoxesThen2OfThemAreHyperGravity_02 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self assert: aBoard getHyperGravityBoxes equals: 2.
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
ABoardTest >> testWhenABoardIsCreatedWith5BoxesThenBoardIsValid [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 5.
	self assert: aBoard hasBoxes equals: 5
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
