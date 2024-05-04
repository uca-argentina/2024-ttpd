Class {
	#name : #ABoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ABoardTest >> testWhenABoardHasABoxThenIsCreated [ 

| aBoard aBox |
aBox:= Box new.
aBoard:= Board withABox: aBox.
self assert: aBoard hasBoxes.
]

{ #category : #tests }
ABoardTest >> testWhenABoardHasTwoBoxesThenItIsABoardWithTwoBoxes [

	| aBoard aBox1 aBox2 aCollectionOfBoxes |
	aBox1 := Box new.
	aBox2 := Box new.
	aCollectionOfBoxes := OrderedCollection new.
	aCollectionOfBoxes addAll: #( aBox1 aBox2 ).
	aBoard := Board withABox: aCollectionOfBoxes.
	self assert: aBoard hasBoxes
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenHasABox [ 

| aBoard |
aBoard:= Board new.
self assert: aBoard hasBoxes.
]
