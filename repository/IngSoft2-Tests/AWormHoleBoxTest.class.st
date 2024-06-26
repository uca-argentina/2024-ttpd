Class {
	#name : #AWormHoleBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AWormHoleBoxTest >> testWhenAWormHoleKnowsItsDestiny_05 [

	| aWormholeBox anotherWormholeBox |
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.

	self assert: aWormholeBox getDestiny equals: anotherWormholeBox .
	self assert: anotherWormholeBox getDestiny equals: aWormholeBox .
]
