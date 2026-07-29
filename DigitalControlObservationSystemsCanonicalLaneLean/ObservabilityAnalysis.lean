import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsCanonicalLaneLean.ControlSystemObject

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure ObservabilityPackage (O : ControlSystemObject) where
  observabilityMatrixRank : Prop
  observabilityGramianPositive : Prop
  detectabilityCondition : Prop

structure ObservabilityEvidence (O : ControlSystemObject) (P : ObservabilityPackage O) where
  observabilityMatrixRankClosed : P.observabilityMatrixRank
  observabilityGramianPositiveClosed : P.observabilityGramianPositive
  detectabilityConditionClosed : P.detectabilityCondition

def ObservabilityClosed (O : ControlSystemObject) (P : ObservabilityPackage O) : Prop :=
  P.observabilityMatrixRank ∧ P.observabilityGramianPositive ∧ P.detectabilityCondition

theorem observability_closed_from_evidence (O : ControlSystemObject) (P : ObservabilityPackage O)
    (E : ObservabilityEvidence O P) : ObservabilityClosed O P := by
  exact And.intro E.observabilityMatrixRankClosed
    (And.intro E.observabilityGramianPositiveClosed E.detectabilityConditionClosed)

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
