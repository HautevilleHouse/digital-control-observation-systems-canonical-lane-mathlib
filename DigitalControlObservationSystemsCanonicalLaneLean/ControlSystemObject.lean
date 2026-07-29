import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure ControlSystemObject where
  stateSpace : Type u
  observationSpace : Type v
  dynamics : stateSpace → stateSpace
  observationMap : stateSpace → observationSpace
  controllability : Prop
  observability : Prop
  stabilization : Prop
  conclusion : controllability ∧ observability ∧ stabilization

def ControlSystemClosed (O : ControlSystemObject) : Prop :=
  O.controllability ∧ O.observability ∧ O.stabilization

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
