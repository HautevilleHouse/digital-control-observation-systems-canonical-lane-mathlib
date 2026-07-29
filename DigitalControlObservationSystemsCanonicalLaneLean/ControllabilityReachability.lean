import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystems

structure ControllabilityReachabilityPackage where
  reachableSet : Type u
  controllabilityGramian : Type v
  reachabilityCondition : Prop
  controllabilityCondition : Prop

structure ControllabilityReachabilityEvidence (C : ControllabilityReachabilityPackage) where
  reachabilityConditionClosed : C.reachabilityCondition
  controllabilityConditionClosed : C.controllabilityCondition

def ControllabilityReachabilityClosed (C : ControllabilityReachabilityPackage) : Prop :=
  C.reachabilityCondition ∧ C.controllabilityCondition

theorem controllability_reachability_closed_from_evidence
    (C : ControllabilityReachabilityPackage) (E : ControllabilityReachabilityEvidence C) :
    ControllabilityReachabilityClosed C := by
  exact And.intro E.reachabilityConditionClosed E.controllabilityConditionClosed

end DigitalControlObservationSystems
end HautevilleHouse