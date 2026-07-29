import DigitalControlObservationSystemsCanonicalLaneLean.ObserverDesign

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure DualityPackage where
  observabilityMatrix : Type
  controllabilityMatrix : Type
  dualityRelation : observabilityMatrix = controllabilityMatrix.transpose
  observabilityControllabilityEquivalence : Prop

structure DualityEvidence (D : DualityPackage) where
  observabilityControllabilityEquivalenceClosed : D.observabilityControllabilityEquivalence

def DualityClosed (D : DualityPackage) : Prop :=
  D.observabilityControllabilityEquivalence

theorem duality_closed_from_evidence (D : DualityPackage) (E : DualityEvidence D) :
    DualityClosed D := by
  exact E.observabilityControllabilityEquivalenceClosed

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse