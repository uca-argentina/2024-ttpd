Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'box',
		'aCollectionOfBoxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Board class >> withACollectionOfBoxes: aCollectionOfBoxes [

	^ self new initializeWithBox: aCollectionOfBoxes
]

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes [ 
	^self new initialiceWithANumberOfBoxes: aNumberOfBoxes.
]

{ #category : #testing }
Board >> hasBoxes [

	(aCollectionOfBoxes isEmpty )  ifTrue: [ ^false ] ifFalse: [ ^true ]
]

{ #category : #'as yet unclassified' }
Board >> initialiceWithANumberOfBoxes: aNumberOfBoxes [ 
	|number|
	number := aNumberOfBoxes.
	aCollectionOfBoxes := OrderedCollection new.
	[ number > 0 ] whileTrue: [ aCollectionOfBoxes add: (Box inPlace: number). number := number - 1.].
	
	
]

{ #category : #initialization }
Board >> initializeWithBox: aBox [ 
	box:= aBox.
	
]
