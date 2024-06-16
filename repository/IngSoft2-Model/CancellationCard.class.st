Class {
	#name : 'CancellationCard',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'removing' }
CancellationCard >> removeCard: aCard from: aCollectionOfActiveCards [ 
	aCollectionOfActiveCards remove: aCard
]
