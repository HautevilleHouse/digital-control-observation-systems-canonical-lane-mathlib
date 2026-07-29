import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsCanonicalLaneLean.ControlSystemObject

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure ControllabilityPackage (O : ControlSystemObject) where
  controllabilityMatrixRank : Prop
  controllabilityGramianPositive : Prop
  stabilizabilityCondition : Prop

structure ControllabilityEvidence (O : ControlSystemObject) (P : ControllabilityPackage O) where
  controllabilityMatrixRankClosed : P.controllabilityMatrixRank
  controllabilityGramianPositiveClosed : P.controllabilityGramianPositive
  stabilizabilityConditionClosed : P.stabilizabilityCondition

def ControllabilityClosed (O : ControlSystemObject) (P : ControllabilityPackage O) : Prop :=
  P.controllabilityMatrixRank ∧ P.controllabilityGramianPositive ∧ P.stabilizabilityCondition

theorem controllability_closed_from_evidence (O : ControlSystemObject) (P : ControllabilityPackage O)
    (E : ControllabilityEvidence O P) : ControllabilityClosed O P := by
  exact And.intro E.controllabilityMatrixRankClosed
    (And.intro E.controllabilityGramianPositiveClosed E.stabilizabilityConditionClosed)

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
