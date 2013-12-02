###
ROSE is a browser extension researchers can use to capture in situ 
data on how users actually use the online social network Facebook.
Copyright (C) 2013

    Fraunhofer Institute for Secure Information Technology
    Andreas Poller <andreas.poller@sit.fraunhofer.de>

Authors  

    Oliver Hoffmann <oliverh855@gmail.com>
    Sebastian Ruhleder <sebastian.ruhleder@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
###

require 'Storage/RoseData'

class @Storage
    @addPlatform: (platformName) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.addPlatform(platformName)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()
    
    @hasPlatform: (platformName, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            hasPlatform = roseData.hasPlatform(platformName)
            
            callback(hasPlatform)
    
    @addInteraction: (record, platformName) ->
        console.log("[INTERACTION] " + JSON.stringify(record))
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.addInteraction(record, platformName)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()

    @getInteraction: (index, platformName, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            interaction = roseData.getInteraction(index, platformName)
            
            callback(interaction)

    @getInteractions: (platformName, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            interactions = roseData.getInteractions(platformName)
            
            callback(interactions)

    @removeInteraction: (index, platformName, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.removeInteraction(index, platformName)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData(), callback

    @hideInteraction: (index, hide, platformName, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.hideInteraction(index, hide, platformName)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData(), callback

    @addComment: (comment, platformName) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.addComment(comment, platformName)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()

    @getComment: (index, platformName, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            comment = roseData.getComment(index, platformName)
            
            callback(comment)

    @getComments: (platformName, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            comments = roseData.getComments(platformName)
            
            callback(comments)

    @removeComment: (index, platformName) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.removeComment(index, platformName)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()

    @addDiaryEntry: (entry) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.addDiaryEntry(entry)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()
    
    @removeDiaryEntry: (index) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.removeDiaryEntry(index)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()

    @updateDiaryEntry: (index, text, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.updateDiaryEntry(index, text)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData(), callback

    @getDiaryEntries: (callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            entries = roseData.getDiaryEntries()
            
            callback(entries)
    
    @getPrivacyEntry: (platformName, callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            entry = roseData.getPrivacyEntry(platformName)
            
            callback(entry)
    
    @setPrivacyEntry: (entry, platformName) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.setPrivacyEntry(entry, platformName)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()
    
    @getMetaInformation: (callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            meta = roseData.getMeta()
            
            callback(meta)
    
    @setMetaInformation: (meta) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.setPrivacyEntry(entry, platformName)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()
    
    @appendMetaInformation: (meta) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseData = new RoseData(roseStorage)
            
            roseData.setMeta(meta)
            
            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseData.getData()

    @getStorageAsJson: (callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            callback JSON.stringify roseStorage, undefined, 2

    @setStorage: (json, callback) ->
        store = JSON.parse(json)
        kango.invokeAsync 'kango.storage.setItem', 'roseStorage', store, callback

    @getSettings: (callback) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            settings = roseStorage.settings
            callback settings || {}

    @setSettings: (key, settings) ->
        kango.invokeAsync 'kango.storage.getItem', 'roseStorage', (roseStorage) ->
            roseStorage.settings[key] = settings

            kango.invokeAsync 'kango.storage.setItem', 'roseStorage', roseStorage
