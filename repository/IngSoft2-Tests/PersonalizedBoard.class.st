Class {
	#name : #PersonalizedBoard,
	#superclass : #Object,
	#instVars : [
		'boxes'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'as yet unclassified' }
PersonalizedBoard class >> createWith10Boxes [
	^self new initializeWith10Boxes.
]

{ #category : #'as yet unclassified' }
PersonalizedBoard class >> withANumberOfBoxes: aNumberOfBoxes [

	aNumberOfBoxes < 1 ifTrue: [
		Error signal: 'A Board must have at least 1 box to be created' ].
	^ self new initializeWithNumberOfBoxes: aNumberOfBoxes
]

{ #category : #testing }
PersonalizedBoard >> hasBoxes [
	^boxes size.
]

{ #category : #initialization }
PersonalizedBoard >> initializeWith10Boxes [
	boxes := OrderedCollection new: 10.
	1 to: 10 do: [ :i | boxes add: Box new ].
]

{ #category : #initialization }
PersonalizedBoard >> initializeWithNumberOfBoxes: aNumberOfBoxes [ 
	boxes := OrderedCollection new: aNumberOfBoxes.
	1 to: aNumberOfBoxes do: [ :i | boxes add: Box new ].
]

{ #category : #accessing }
PersonalizedBoard >> move: aShip withDiceResult: aDiceResult [ 
	| actualPosition positionsMoved|
	actualPosition := aShip moves: aDiceResult.
	actualPosition > boxes size ifTrue: [
		actualPosition := actualPosition - (boxes size). 
		aShip updateLaps. ].
	(boxes at: actualPosition) effectsOn ~= 0 ifTrue: [
		aShip movesTo: (boxes at: actualPosition) effectsOn ].
	positionsMoved := aDiceResult + (boxes at: actualPosition) effectsOn.
	aShip consumeFuel: positionsMoved.
]
