{AnimalModel} = require('models/animal_model')
{AnimalCollection} = require('collections/animal_collection')

class exports.ZooModel extends Backbone.RelationalModel

  relations: [{
    type: Backbone.HasMany
    key: 'animals'
    relatedModel: AnimalModel
    collectionType: AnimalCollection
    reverseRelation:
      key: 'livesIn'
      includeInJSON: 'id'
  }]