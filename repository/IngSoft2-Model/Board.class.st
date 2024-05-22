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

{ #category : #'as yet unclassified' }
Board class >> withNumberOfBoxes: aNumberOfBoxes withWormHoleStaringIn: wormHoleStartPosition andEndingIn: wormHoleEndPosition [

	aNumberOfBoxes < 1 ifTrue: [
		Error signal: 'A Board must have at least 1 box to be created' ].
	wormHoleStartPosition < 1 ifTrue: [
		Error signal: 'A WormHole must Start in box 1 or more' ].
	wormHoleEndPosition > aNumberOfBoxes ifTrue: [
		Error signal: 'The ending position of the wormHole must be lower than the number of boxes of the board' ].
	wormHoleStartPosition > wormHoleEndPosition ifTrue: [
		Error signal:
			'A WormHole starting position must be less than the ending position' ].
	^ self new initialiceWithANumberOfBoxes: aNumberOfBoxes withWormHoleStaringIn: wormHoleStartPosition andEndingIn: wormHoleEndPosition.
]

{ #category : #accessing }
Board >> boxAt: position [ 
	^boxes at: position
]

{ #category : #testing }
Board >> exitWormHole [
	^wormHole at:2.
]

{ #category : #testing }
Board >> hasBoxes [

	^ boxes size
]

{ #category : #testing }
Board >> hasWormHole [
	^wormHole 
]

{ #category : #initialize }
Board >> initialiceWithANumberOfBoxes: aNumberOfBoxes withWormHoleStaringIn: wormHoleStartPosition andEndingIn: wormHoleEndPosition [

	boxes := OrderedCollection new: aNumberOfBoxes.
	1 to: aNumberOfBoxes do: [ :i | boxes add: Box new ].

	boxes at: wormHoleStartPosition put: (WormHoleBox inPlace:  wormHoleEndPosition).
	boxes at: wormHoleEndPosition put: (WormHoleBox inPlace: wormHoleStartPosition)
]

{ #category : #testing }
Board >> inputWormHole [
	^wormHole at:1.
]
