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
ABoardTest >> testABoardCannotBeCreatedWithAWormHoleStartingIn0 [

	self
		should: [
		Board withNumberOfBoxes: 5 withWormHoleStaringIn: 0 andEndingIn: 3 ]
		raise: Error
		withMessage: 'A WormHole must Start in box 1 or more'
]

{ #category : #tests }
ABoardTest >> testABoardCannotBeCreatedWithLEssThanOneBox [

	self
		should: [Board withNumberOfBoxes: 0]
		raise: Error
		withMessage: 'A Board must have at least 1 box to be created'.
]

{ #category : #tests }
ABoardTest >> testABoardIsCreatedWithOneBox [ 

| aBoard |
aBoard := Board withNumberOfBoxes: 1.
self assert: aBoard hasBoxes equals: 1.
]

{ #category : #tests }
ABoardTest >> testABoardIsCreatedWithThreeBoxes [ 

| aBoard |
aBoard := Board withNumberOfBoxes: 3.
self assert: aBoard hasBoxes equals: 3 .
]

{ #category : #tests }
ABoardTest >> testAWormHoleEndingPositionMustBeLowerThanTheNumberOfBoxesOfTheBoard [
	self should: [Board withNumberOfBoxes: 5 withWormHoleStaringIn: 1 andEndingIn: 6] raise: Error withMessage: 'The ending position of the wormHole must be lower than the number of boxes of the board' .
]

{ #category : #tests }
ABoardTest >> testAWormHoleIsCreated [

	| aBoard |
	aBoard := Board
		          withNumberOfBoxes: 5
		          withWormHoleStaringIn: 1
		          andEndingIn: 2.
	self assert: aBoard hasWormHole = (OrderedCollection with: 1 with: 2)
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedWith1Box [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 1.
	self assert: aBoard hasBoxes equals: 1
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedWith5Boxes [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 5.
	self assert: aBoard hasBoxes equals: 5
]
