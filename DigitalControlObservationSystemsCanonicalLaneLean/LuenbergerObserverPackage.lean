import digitalControlObservationSystemsCanonicalLaneLean.KalmanControllabilityPackage
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure LuenbergerObserverPackage (C : ControllabilityPackage) where
  observerStateDimension : ℕ
  observerGain : Matrix (Fin C.stateSpaceDimension) (Fin C.stateSpaceDimension) ℝ
  errorDynamics : Matrix (Fin C.stateSpaceDimension) (Fin C.stateSpaceDimension) ℝ
  errorStability : Prop
  separationPrinciple : Prop
  convergenceRate : ℝ
  dualControlLaw : Prop
  errorStabilityClosed : errorStability
  separationPrincipleClosed : separationPrinciple
  convergenceRateClosed : convergenceRate > 0
  dualControlLawClosed : dualControlLaw

structure ObserverEvidence {C : ControllabilityPackage} (L : LuenbergerObserverPackage C) where
  errorStabilityClosed : L.errorStability
  separationPrincipleClosed : L.separationPrinciple
  convergenceRateClosed : L.convergenceRate > 0
  dualControlLawClosed : L.dualControlLaw

def ObserverClosed {C : ControllabilityPackage} (L : LuenbergerObserverPackage C) : Prop :=
  L.errorStability ∧ L.separationPrinciple ∧ (L.convergenceRate > 0) ∧ L.dualControlLaw

theorem observer_closed_from_evidence {C : ControllabilityPackage} (L : LuenbergerObserverPackage C) (E : ObserverEvidence L) :
    ObserverClosed L := by
  exact And.intro E.errorStabilityClosed (And.intro E.separationPrincipleClosed (And.intro E.convergenceRateClosed E.dualControlLawClosed))

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse