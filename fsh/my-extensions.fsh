 Extension:   DEQMMeasureScoring
 Id:          extension-measureScoring
 Title:       "DEQM Measure Scoring Extension"
 Description: "Indicates how the calculation is performed for the measure, including proportion, ratio, continuous-variable, and cohort. The value set is extensible, allowing additional measure scoring types to be represented. It is expected to be the same as the scoring element on the referenced Measure"
* ^context.type = #element
* ^context.expression = "MeasureReport"
 * value[x] only CodeableConcept
 * valueCodeableConcept.coding.code from http:hl7.org/fhir/ValueSet/measure-scoring (extensible)

 Extension:   DEQMSubmitDataUpdateType
 Id:          extension-submitDataUpdateType
 Title:       "DEQM Submit Data Update Type Extension"
 Description: "This Extension supports the concepts 'incremental' and 'snapshot'. The DEQM Consumer Server **SHALL** use this Extension to advertise whether it supports [snapshot](index.html#incremental-update) or [incremental](index.html#snapshot-update) updates for the [DEQM Submit Data transaction](datax.html#submit-data). The DEQM Producer **SHALL** use this Extension to indicate whether the payload is a snapshot or incremental update for Submit Data transactiosn."
* ^context[0].type = #element
* ^context[0].expression = "CapabiltityStatement.rest.resource.operation"
* ^context[1].type = #element
* ^context[1].expression = "MeasureReport"
 * value[x] only code
 * valueCode from DEQMUpdateTypeValueSet

 CodeSystem:  DEQMUpdateTypeCodeSystem
 Id:          update-type
 Title:       "DEQM Update Type Code System"
 Description: "Concepts for how a DEQM Consumer supports data exchange updates. The choices are snapshot or incremental updates"
 * #incremental         "Incremental"         "In contrast to the Snapshot Update, the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains only the new and updated DEQM and QI Core Profiles since the last transaction. If the Consumer supports incremental updates, the contents of the updated payload updates the previous payload data."
 * #snapshot       "Snapshot"       "In contrast to the Incremental Update, the FHIR Parameters resource used in a Submit Data or the Collect Data scenario contains all the DEQM and QI Core Profiles for each transaction.  If the Consumer supports snapshot updates, the contents of the updated payload entirely replaces the previous payload"

 ValueSet:  DEQMUpdateTypeValueSet
 Id:          update-type
 Title:       "DEQM Update Type Value Set"
 Description: "Concepts for how a DEQM Consumer supports data exchange updates. The choices are snapshot or incremental updates"
 * codes from system DEQMUpdateTypeCodeSystem