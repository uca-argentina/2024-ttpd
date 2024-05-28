Class {
	#name : #MoonWalkBox,
	#superclass : #Box,
	#instVars : [
		'numberOfBoxesToMove'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MoonWalkBox >> getnumberOfBoxesToMove [
	^numberOfBoxesToMove.
]

{ #category : #'as yet unclassified' }
MoonWalkBox >> numberOfBoxesToMove: aNumberOfBoxesToMove [ 
	numberOfBoxesToMove := aNumberOfBoxesToMove.
]
