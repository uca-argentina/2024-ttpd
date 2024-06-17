Class {
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'theThing',
		'playedBy',
		'affected'
	],
	#category : 'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCard >> playBy: aShip to: something withShips: aCollection [ 
	player:=aShip.
	affected:=something.
]
