import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationCanonicalLaneLean

structure DigitalControlAdmittedObject where
  stateSpace : Type
  observationMap : Type
  controlLaw : Type
  observationClosed : Prop
  controlClosed : Prop
  observationClosedTerm : observationClosed
  controlClosedTerm : controlClosed

structure AdmissibleClass where
  object : DigitalControlAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DigitalControlWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def DigitalControlWitnessClosed (O : DigitalControlAdmittedObject) : Prop :=
  O.observationClosed ∧ O.controlClosed

end DigitalControlObservationCanonicalLaneLean
end HautevilleHouse