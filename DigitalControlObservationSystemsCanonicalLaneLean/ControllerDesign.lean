import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsCanonicalLaneLean.StateSpaceModel

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure ControllerDesignPackage {S : StateSpaceModel} where
  controlLaw : S.stateType → S.inputType
  stateFeedbackGain : Prop
  outputFeedbackGain : Prop
  closedLoopStability : Prop
  performanceCriterion : Prop

structure ControllerDesignEvidence {S : StateSpaceModel}
    (C : ControllerDesignPackage S) where
  controlLawDefined : True
  stateFeedbackGainClosed : C.stateFeedbackGain
  outputFeedbackGainClosed : C.outputFeedbackGain
  closedLoopStabilityClosed : C.closedLoopStability
  performanceCriterionClosed : C.performanceCriterion

def ControllerDesignClosed {S : StateSpaceModel}
    (C : ControllerDesignPackage S) : Prop :=
  C.stateFeedbackGain ∧ C.outputFeedbackGain ∧
  C.closedLoopStability ∧ C.performanceCriterion

theorem controller_design_closed_from_evidence
    {S : StateSpaceModel} (C : ControllerDesignPackage S)
    (E : ControllerDesignEvidence C) : ControllerDesignClosed C := by
  exact And.intro E.stateFeedbackGainClosed
    (And.intro E.outputFeedbackGainClosed
      (And.intro E.closedLoopStabilityClosed E.performanceCriterionClosed))

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse