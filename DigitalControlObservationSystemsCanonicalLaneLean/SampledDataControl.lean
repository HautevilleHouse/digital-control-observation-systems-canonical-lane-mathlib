import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystems

structure SampledDataControlPackage where
  samplingPeriod : Type u
  zeroOrderHold : Type v
  discreteTimeDynamics : Type w
  stabilityCondition : Prop
  intersampleBehavior : Prop

structure SampledDataControlEvidence (S : SampledDataControlPackage) where
  stabilityConditionClosed : S.stabilityCondition
  intersampleBehaviorClosed : S.intersampleBehavior

def SampledDataControlClosed (S : SampledDataControlPackage) : Prop :=
  S.stabilityCondition ∧ S.intersampleBehavior

theorem sampled_data_control_closed_from_evidence
    (S : SampledDataControlPackage) (E : SampledDataControlEvidence S) :
    SampledDataControlClosed S := by
  exact And.intro E.stabilityConditionClosed E.intersampleBehaviorClosed

end DigitalControlObservationSystems
end HautevilleHouse