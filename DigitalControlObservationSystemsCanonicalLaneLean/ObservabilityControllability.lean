import DigitalControlObservationSystemsCanonicalLaneLean.ObservationSystemObjects

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure ObservabilityPackage where
  observabilityMatrix : Type
  rankCondition : Prop
  dualityWithControllability : Prop
  observabilityGramian : Type
  gramianPositiveDefinite : Prop

structure ObservabilityEvidence (Opkg : ObservabilityPackage) where
  rankConditionClosed : Opkg.rankCondition
  gramianPositiveDefiniteClosed : Opkg.gramianPositiveDefinite

def ObservabilityClosed (Opkg : ObservabilityPackage) : Prop :=
  Opkg.rankCondition ∧ Opkg.gramianPositiveDefinite

theorem observability_closed_from_evidence (Opkg : ObservabilityPackage) (E : ObservabilityEvidence Opkg) :
    ObservabilityClosed Opkg := by
  exact And.intro E.rankConditionClosed E.gramianPositiveDefiniteClosed

structure ControllabilityPackage where
  controllabilityMatrix : Type
  rankCondition : Prop
  controllabilityGramian : Type
  gramianPositiveDefinite : Prop

structure ControllabilityEvidence (Cpkg : ControllabilityPackage) where
  rankConditionClosed : Cpkg.rankCondition
  gramianPositiveDefiniteClosed : Cpkg.gramianPositiveDefinite

def ControllabilityClosed (Cpkg : ControllabilityPackage) : Prop :=
  Cpkg.rankCondition ∧ Cpkg.gramianPositiveDefinite

theorem controllability_closed_from_evidence (Cpkg : ControllabilityPackage) (E : ControllabilityEvidence Cpkg) :
    ControllabilityClosed Cpkg := by
  exact And.intro E.rankConditionClosed E.gramianPositiveDefiniteClosed

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse