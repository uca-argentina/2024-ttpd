Class {
	#name : #OverloadCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
OverloadCard >> aplyEffectFrom: aShip to: anotherShip withShips: aCollectionOfShips [
	
	anotherShip addActiveCards: OverloadCard new.
]

{ #category : #'as yet unclassified' }
OverloadCard >> powerMove [
	^-2.
]
