Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'wormHole'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes [ 
	aNumberOfBoxes < 1 ifTrue: [ Error signal: 'A Board must have at least 1 box to be created' ].
	^self new initialiceWithANumberOfBoxes: aNumberOfBoxes.
]

{ #category : #testing }
Board >> hasBoxes [
	^boxes.
]

{ #category : #testing }
Board >> hasWormHole [
	^wormHole 
]

{ #category : #'as yet unclassified' }
Board >> initialiceWithANumberOfBoxes: aNumberOfBoxes [ 
	
	boxes:= aNumberOfBoxes.
	
	
]
