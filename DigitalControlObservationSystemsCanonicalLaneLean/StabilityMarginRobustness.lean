import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsCanonicalLaneLean.StateSpaceModel

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure StabilityMarginRobustnessPackage {S : StateSpaceModel} where
  gainMargin : Prop
  phaseMargin : Prop
  robustStabilityCondition : Prop
  uncertaintyModel : Prop

def StabilityMarginRobustnessClosed {S : StateSpaceModel}
    (R : StabilityMarginRobustnessPackage S) : Prop :=
  R.gainMargin ∧ R.phaseMargin ∧ R.robustStabilityCondition ∧ R.uncertaintyModel

theorem stability_margin_robustness_closed
    {S : StateSpaceModel} (R : StabilityMarginRobustnessPackage S) :
    StabilityMarginRobustnessClosed R := by
  exact And.intro R.gainMargin
    (And.intro R.phaseMargin (And.intro R.robustStabilityCondition R.uncertaintyModel))

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse