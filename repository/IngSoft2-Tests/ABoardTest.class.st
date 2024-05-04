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
self assert: aBoard hasABox.
]

{ #category : #tests }
ABoardTest >> testWhenABoardIsCreatedThenHasABox [ 

| aBoard |
aBoard:= Board new.
self assert: aBoard hasABox.
]
