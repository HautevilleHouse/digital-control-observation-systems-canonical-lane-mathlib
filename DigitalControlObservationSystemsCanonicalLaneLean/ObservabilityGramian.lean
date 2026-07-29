import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystems

structure ObservabilityGramianPackage where
  observabilityMatrix : Type u
  gramianMatrix : Type v
  fullRankCondition : Prop
  observabilityIndex : Prop
  detectabilityCondition : Prop

structure ObservabilityGramianEvidence (O : ObservabilityGramianPackage) where
  fullRankConditionClosed : O.fullRankCondition
  observabilityIndexClosed : O.observabilityIndex
  detectabilityConditionClosed : O.detectabilityCondition

def ObservabilityGramianClosed (O : ObservabilityGramianPackage) : Prop :=
  O.fullRankCondition ∧ O.observabilityIndex ∧ O.detectabilityCondition

theorem observability_gramian_closed_from_evidence
    (O : ObservabilityGramianPackage) (E : ObservabilityGramianEvidence O) :
    ObservabilityGramianClosed O := by
  exact And.intro E.fullRankConditionClosed
    (And.intro E.observabilityIndexClosed E.detectabilityConditionClosed)

end DigitalControlObservationSystems
end HautevilleHouse