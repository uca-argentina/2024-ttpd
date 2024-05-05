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
