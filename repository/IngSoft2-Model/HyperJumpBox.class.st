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
HyperJumpBox class >> inPlace: aPosition parsecsList: aPaesecList withBoardLenght: aBoardLength andParsecLength: aParsecLength [ 
	^self new initializeInPlace: aPosition parsecsList: aPaesecList withBoardLenght: aBoardLength andParsecLength: aParsecLength.
]

{ #category : #adding }
HyperJumpBox >> addParsecsList: aParsecList withBoardLenght: aBoardLength andParsecLength: aParsecLength [ 
	parsecList := (aParsecList asSortedCollection: [ :a :b | a > b ])
	              asArray.
	boardLength := aBoardLength.
	parsecLength := aParsecLength.
	parsecBoxProp := aBoardLength / aParsecLength.
	parsecNumber := 0
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> effectShips: aCollection playing: aShip [

	| parsecs positionsToMove |
	parsecs := (parsecList at: self parsecsToMove) convertToParsec.
	positionsToMove := parsecs * parsecBoxProp.
	positionsToMove := positionsToMove > 0.5
		                   ifTrue: [ positionsToMove ceiling ]
		                   ifFalse: [ positionsToMove floor ].
	aShip moves: positionsToMove.
	aShip consumeFuel: positionsToMove
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> getParsecLenght [
	^parsecLength.
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> getParsecList [
	^parsecList 
]

{ #category : #initialization }
HyperJumpBox >> initializeInPlace: aPosition parsecsList: aParsecList withBoardLenght: aBoardLength andParsecLength: aParsecLength [
	place := aPosition.
	parsecList := (aParsecList asSortedCollection: [ :a :b | a > b ])
	              asArray.
	boardLength := aBoardLength.
	parsecLength := aParsecLength.
	parsecBoxProp := aBoardLength / aParsecLength.
	parsecNumber := 0
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> parsecBoxProportion [
	^parsecBoxProp .
]

{ #category : #'as yet unclassified' }
HyperJumpBox >> parsecsToMove [
	parsecNumber := parsecNumber < parsecList size
		                ifTrue: [ parsecNumber + 1 ]
		                ifFalse: [ 1 ].
	^parsecNumber
]
