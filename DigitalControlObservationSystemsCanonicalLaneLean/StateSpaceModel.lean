import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure StateSpaceModel where
  stateType : Type u
  inputType : Type v
  outputType : Type w
  dynamics : stateType → inputType → stateType
  observation : stateType → outputType
  initialState : stateType
  stateTransitionWellDefined : Prop
  observationMapWellDefined : Prop

structure StateSpaceModelEvidence (S : StateSpaceModel) where
  stateTransitionWellDefinedClosed : S.stateTransitionWellDefined
  observationMapWellDefinedClosed : S.observationMapWellDefined

def StateSpaceModelClosed (S : StateSpaceModel) : Prop :=
  S.stateTransitionWellDefined ∧ S.observationMapWellDefined

theorem state_space_model_closed_from_evidence
    (S : StateSpaceModel) (E : StateSpaceModelEvidence S) : StateSpaceModelClosed S := by
  exact And.intro E.stateTransitionWellDefinedClosed E.observationMapWellDefinedClosed

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse