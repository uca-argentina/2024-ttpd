Class {
	#name : #LoadedDieWithSequence,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDieWithSequence class >> of: aNumberOfFaces [ 
	^self new initializeOf: aNumberOfFaces.
]

{ #category : #initialization }
LoadedDieWithSequence >> initializeOf: aNumberOfFaces [ 
	faces := aNumberOfFaces.
]

{ #category : #'as yet unclassified' }
LoadedDieWithSequence >> throw [
	| sequence |
	sequence := OrderedCollection new.
	faces = 4 ifTrue: [ 
	sequence add: 1.
	sequence add: 2.
	sequence add: 3.
	sequence add: 4.]
	ifFalse: [ sequence add: 1.
	sequence add: 2.
	sequence add: 3.
	sequence add: 4. 
	sequence add: 5.].
	^sequence.	
]
