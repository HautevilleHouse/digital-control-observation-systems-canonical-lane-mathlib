import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure ObservationAdmittedObject where
  stateSpace : Type
  observationSpace : Type
  controlSpace : Type
  dynamics : stateSpace → controlSpace → stateSpace
  observation : stateSpace → observationSpace
  controllabilityCondition : Prop
  observabilityCondition : Prop
  conclusion : observabilityCondition

structure AdmissibleClass where
  object : ObservationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ObservationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ObservationWitnessClosed (O : ObservationAdmittedObject) : Prop :=
  O.observabilityCondition

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse