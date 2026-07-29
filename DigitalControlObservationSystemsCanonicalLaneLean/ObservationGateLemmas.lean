import DigitalControlObservationSystemsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse