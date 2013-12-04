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

require 'Utilities'

class @GooglePlusPlusOneObserver
    patterns: [
        '<div><div><header><h3><a>{owner}</a></h3></header></div><div>{content}</div></div>'
    ]

    container: 'div[jscontroller=LeWvCf]'
  
    getIntegrationPatterns: ->
        ["div[jscontroller=qG1h8c]"]

    getEventType: ->
        "click"

    handleNode: (node) ->
        console.log("HALLO")
        # Get parent container.
        parent = $(node).closest(@container)

        # Traverse through patterns.
        records = []
        for pattern in @patterns
            record = {}
            
            # Assemble pattern for call.
            args =
                structure: pattern
            
            # Try to apply pattern.
            result = $(parent).applyPattern(args)
            
            if result['success']
                # Successful? Sanitize and return record.
                record['object'] = result['data'][0]

                # Set object container type.
                record['object']['type'] = container
                
                # Set interaction type.
                record['type'] = "+1"
                
                records.push(record)

        # Nothing found? Return failure.
        if records.length == 0
            return {
                'found': false
            }

        # Prepare entry.
        entry = {
            'found': true,
            'record': null
        }

        # Compare results.
        max = 0
        for record in records
            count = 0
            for key, value of record['object']
                if value != ""
                    count = count + 1
            if count > max
                max = count
                entry['record'] = record

        return entry

    getObserverType: ->
        "pattern"
