Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'box'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Board class >> withACollectionOfBoxes: aCollectionOfBoxes [

	^ self new initializeWithBox: aCollectionOfBoxes
]

{ #category : #testing }
Board >> hasBoxes [

	box isEmpty ifTrue: [ ^false. ].
	^true.
]

{ #category : #initialization }
Board >> initializeWithBox: aBox [ 
	box:= aBox.
	
]
