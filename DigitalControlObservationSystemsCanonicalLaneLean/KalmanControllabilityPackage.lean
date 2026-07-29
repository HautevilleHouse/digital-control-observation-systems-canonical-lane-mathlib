import digitalControlObservationSystemsCanonicalLaneLean.AdmissibleClass
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure ControllabilityPackage where
  stateSpaceDimension : ℕ
  controlDimension : ℕ
  A : Matrix (Fin stateSpaceDimension) (Fin stateSpaceDimension) ℝ
  B : Matrix (Fin stateSpaceDimension) (Fin controlDimension) ℝ
  controllabilityMatrix : Matrix (Fin stateSpaceDimension) (Fin (stateSpaceDimension * controlDimension)) ℝ
  fullRankCondition : Prop
  reachableSubspace : Submodule ℝ (Fin stateSpaceDimension → ℝ)
  controllabilityGramian : Matrix (Fin stateSpaceDimension) (Fin stateSpaceDimension) ℝ
  gramianPositiveDefinite : Prop
  pairingWithControlLaw : Prop
  controllabilityIndex : ℕ
  rankConditionClosed : fullRankCondition
  gramianClosed : gramianPositiveDefinite
  pairingClosed : pairingWithControlLaw

structure ControllabilityEvidence (C : ControllabilityPackage) where
  fullRankConditionClosed : C.fullRankCondition
  gramianPositiveDefiniteClosed : C.gramianPositiveDefinite
  pairingWithControlLawClosed : C.pairingWithControlLaw

def ControllabilityClosed (C : ControllabilityPackage) : Prop :=
  C.fullRankCondition ∧ C.gramianPositiveDefinite ∧ C.pairingWithControlLaw

theorem controllability_closed_from_evidence (C : ControllabilityPackage) (E : ControllabilityEvidence C) :
    ControllabilityClosed C := by
  exact And.intro E.fullRankConditionClosed (And.intro E.gramianPositiveDefiniteClosed E.pairingWithControlLawClosed)

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse