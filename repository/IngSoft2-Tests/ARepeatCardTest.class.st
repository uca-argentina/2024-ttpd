Class {
	#name : #ARepeatCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ARepeatCardTest >> test_01_WhenARepeatCardAppliesIsPlayedThenABoxEffectsOnAShip [

	| aCard aBox aShip ships |
	aCard := RepeatCard new.
	aBox := BlackHoleBox inPlace: 4.
	aShip := Ship createWithMaxFuel: 1000.
	aShip moves: 5.
	ships := OrderedCollection new.
	ships add: aShip.
	aCard applyEffect: aBox toShip: aShip withShipsPlaying: ships.
	self assert: aShip getPosition equals: 2
]
