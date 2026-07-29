import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsCanonicalLaneLean.StateSpaceModel

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure ObservabilityReachabilityPackage {S : StateSpaceModel} where
  observabilityGramian : Prop
  reachabilityGramian : Prop
  observabilityCondition : Prop
  reachabilityCondition : Prop
  outputControllabilityCondition : Prop

structure ObservabilityReachabilityEvidence {S : StateSpaceModel}
    (O : ObservabilityReachabilityPackage S) where
  observabilityGramianClosed : O.observabilityGramian
  reachabilityGramianClosed : O.reachabilityGramian
  observabilityConditionClosed : O.observabilityCondition
  reachabilityConditionClosed : O.reachabilityCondition
  outputControllabilityConditionClosed : O.outputControllabilityCondition

def ObservabilityReachabilityClosed {S : StateSpaceModel}
    (O : ObservabilityReachabilityPackage S) : Prop :=
  O.observabilityGramian ∧ O.reachabilityGramian ∧
  O.observabilityCondition ∧ O.reachabilityCondition ∧
  O.outputControllabilityCondition

theorem observability_reachability_closed_from_evidence
    {S : StateSpaceModel} (O : ObservabilityReachabilityPackage S)
    (E : ObservabilityReachabilityEvidence O) : ObservabilityReachabilityClosed O := by
  exact And.intro E.observabilityGramianClosed
    (And.intro E.reachabilityGramianClosed
      (And.intro E.observabilityConditionClosed
        (And.intro E.reachabilityConditionClosed E.outputControllabilityConditionClosed)))

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse