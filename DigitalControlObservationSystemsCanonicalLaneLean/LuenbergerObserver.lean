import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystems

structure LuenbergerObserverPackage where
  observerDynamics : Type u
  errorDynamics : Type v
  gainMatrix : Type w
  observerConvergenceCondition : Prop
  errorDecayCondition : Prop

structure LuenbergerObserverEvidence (L : LuenbergerObserverPackage) where
  observerConvergenceConditionClosed : L.observerConvergenceCondition
  errorDecayConditionClosed : L.errorDecayCondition

def LuenbergerObserverClosed (L : LuenbergerObserverPackage) : Prop :=
  L.observerConvergenceCondition ∧ L.errorDecayCondition

theorem luenberger_observer_closed_from_evidence
    (L : LuenbergerObserverPackage) (E : LuenbergerObserverEvidence L) :
    LuenbergerObserverClosed L := by
  exact And.intro E.observerConvergenceConditionClosed E.errorDecayConditionClosed

end DigitalControlObservationSystems
end HautevilleHouse