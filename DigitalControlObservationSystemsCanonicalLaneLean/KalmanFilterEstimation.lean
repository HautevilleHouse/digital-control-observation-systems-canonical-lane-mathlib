import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DigitalControlObservationSystemsCanonicalLaneLean.StateSpaceModel

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure KalmanFilterEstimationPackage {S : StateSpaceModel} where
  noiseCovarianceModel : Prop
  predictorStep : S.stateType → S.stateType
  correctorStep : S.stateType → S.outputType → S.stateType
  gainComputation : Prop
  innovationProcess : Prop
  optimalityClaim : Prop

structure KalmanFilterEstimationEvidence {S : StateSpaceModel}
    (K : KalmanFilterEstimationPackage S) where
  noiseCovarianceModelClosed : K.noiseCovarianceModel
  gainComputationClosed : K.gainComputation
  innovationProcessClosed : K.innovationProcess
  optimalityClaimClosed : K.optimalityClaim

def KalmanFilterEstimationClosed {S : StateSpaceModel}
    (K : KalmanFilterEstimationPackage S) : Prop :=
  K.noiseCovarianceModel ∧ K.gainComputation ∧
  K.innovationProcess ∧ K.optimalityClaim

theorem kalman_filter_estimation_closed_from_evidence
    {S : StateSpaceModel} (K : KalmanFilterEstimationPackage S)
    (E : KalmanFilterEstimationEvidence K) : KalmanFilterEstimationClosed K := by
  exact And.intro E.noiseCovarianceModelClosed
    (And.intro E.gainComputationClosed
      (And.intro E.innovationProcessClosed E.optimalityClaimClosed))

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse