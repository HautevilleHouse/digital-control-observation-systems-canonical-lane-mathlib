import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystems

structure KalmanFilterDualityPackage where
  predictorCorrectorForm : Type u
  riccatiEquation : Type v
  optimalGain : Type w
  dualityWithLQR : Prop
  estimationErrorCovariance : Prop

structure KalmanFilterDualityEvidence (K : KalmanFilterDualityPackage) where
  dualityWithLQRClosed : K.dualityWithLQR
  estimationErrorCovarianceClosed : K.estimationErrorCovariance

def KalmanFilterDualityClosed (K : KalmanFilterDualityPackage) : Prop :=
  K.dualityWithLQR ∧ K.estimationErrorCovariance

theorem kalman_filter_duality_closed_from_evidence
    (K : KalmanFilterDualityPackage) (E : KalmanFilterDualityEvidence K) :
    KalmanFilterDualityClosed K := by
  exact And.intro E.dualityWithLQRClosed E.estimationErrorCovarianceClosed

end DigitalControlObservationSystems
end HautevilleHouse