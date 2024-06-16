Class {
	#name : #APermanentCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
APermanentCardTest >> test_01_OveroadCardCreated [ 

| aCard |
aCard:= OverloadCard new.
self assert: (aCard isKindOf: OverloadCard).
]

{ #category : #running }
APermanentCardTest >> test_02_AcceleartionCardCreated [ 

| aCard |
aCard:= AccelerationCard new.
self assert: (aCard isKindOf: AccelerationCard).
]

{ #category : #running }
APermanentCardTest >> test_03_APermamentCardHasPowerMoveThenItReturnsZero [

	| aCard |
	aCard := PermanentCard new.
	self assert: aCard powerMove equals: 0
]
