Class {
	#name : 'AnAccelerationCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AnAccelerationCardTest >> test_01_AcellerationCardPowerMoveIs1 [ 
| aCard |
aCard:= AccelerationCard new.
self assert: aCard powerMove equals: 1.
]
