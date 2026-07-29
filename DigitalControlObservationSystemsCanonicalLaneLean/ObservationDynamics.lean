import DigitalControlObservationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationCanonicalLaneLean

structure ObservationDynamicsPackage (A : AdmissibleClass) where
  stateEvolution : A.object.stateSpace → A.object.stateSpace
  outputMap : A.object.stateSpace → A.object.observationMap
  observabilityCondition : Prop
  detectabilityCondition : Prop

structure ObservationDynamicsEvidence {A : AdmissibleClass} (O : ObservationDynamicsPackage A) where
  observabilityClosed : O.observabilityCondition
  detectabilityClosed : O.detectabilityCondition

def ObservationDynamicsClosed {A : AdmissibleClass} (O : ObservationDynamicsPackage A) : Prop :=
  O.observabilityCondition ∧ O.detectabilityCondition

theorem observation_dynamics_closed_from_evidence {A : AdmissibleClass}
    (O : ObservationDynamicsPackage A) (E : ObservationDynamicsEvidence O) :
    ObservationDynamicsClosed O :=
  And.intro E.observabilityClosed E.detectabilityClosed

end DigitalControlObservationCanonicalLaneLean
end HautevilleHouse