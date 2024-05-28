Class {
	#name : #HyperJumpBox,
	#superclass : #Box,
	#instVars : [
		'parsecList',
		'boardLength',
		'parsecLength',
		'parsecBoxProp',
		'parsecNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
HyperJumpBox >> effectShips: aCollection playing: aShip [ 
	| parsecs positionsToMove |
	parsecs := parsecList at: self parsecsToMove.
	positionsToMove := parsecs*parsecBoxProp. 
	aShip moves: positionsToMove.
	aShip consumeFuel: positionsToMove.
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> getParsecList [
	^parsecList 
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> parsecBoxProportion [
	^parsecBoxProp .
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> parsecsList: aParsecList withBoardLenght: aBoardLength andParsecLength: aParsecLength [
	| collection |
	collection := aParsecList.
	parsecList := collection sorted: [ :a :b | a > b ].
	parsecList := aParsecList asSortedCollection: [ :a :b | a > b ].
	boardLength := aBoardLength.
	parsecLength := aParsecLength.
	parsecBoxProp := aBoardLength//aParsecLength.
	parsecNumber := 0.
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> parsecsToMove [
	parsecNumber := parsecNumber < parsecList size
		                ifTrue: [ parsecNumber + 1 ]
		                ifFalse: [ 1 ].
	^parsecNumber
]
