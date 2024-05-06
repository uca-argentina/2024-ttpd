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
self assert: aBoard hasBoxes  .
]

{ #category : #tests }
ABoardTest >> testABoardIsCreatedWithThreeBoxes [ 

| aBoard |
aBoard := Board withNumberOfBoxes: 3.
self assert: aBoard hasBoxes  .
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
ABoardTest >> testWhenABoardHasABoxThenIsCreated [ 

| aBoard aBox |
aBox:= Box new.
aBoard:= Board withACollectionOfBoxes: aBox.
self assert: aBoard hasBoxes.
]

{ #category : #tests }
ABoardTest >> testWhenABoardHasTwoBoxesThenItIsABoardWithTwoBoxes [

	| aBoard aBox1 aBox2 aCollectionOfBoxes |
	aBox1 := Box new.
	aBox2 := Box new.
	aCollectionOfBoxes := OrderedCollection new.
	aCollectionOfBoxes addAll: #( aBox1 aBox2 ).
	aBoard := Board withACollectionOfBoxes: aCollectionOfBoxes.
	self assert: aBoard hasBoxes
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenHasABox [ 

| aBoard |
aBoard:= Board new.
self assert: aBoard hasBoxes.
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
