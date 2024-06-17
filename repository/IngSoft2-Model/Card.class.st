Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'player'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Card >> getPlayBy [
	^player.
]

{ #category : 'as yet unclassified' }
Card >> playedBy: aShip [ 
	player:=aShip 
]
