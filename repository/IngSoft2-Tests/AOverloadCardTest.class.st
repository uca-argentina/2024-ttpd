Class {
	#name : 'AOverloadCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AOverloadCardTest >> test_01_ThePoweMoveOfAOverloadCardIsMinus2 [ 
| aCard |
aCard:= OverloadCard new.
self assert:aCard powerMove equals: -2.

]
