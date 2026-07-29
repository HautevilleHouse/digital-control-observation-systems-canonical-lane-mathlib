import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystems

structure ObservableSystemState where
  stateVector : Type u
  observationMap : stateVector → Type v
  dynamics : stateVector → stateVector
  observationLaw : Prop
  stateTransitionClosed : Prop

def ObservableSystemStateClosed (S : ObservableSystemState) : Prop :=
  S.observationLaw ∧ S.stateTransitionClosed

end DigitalControlObservationSystems
end HautevilleHouse