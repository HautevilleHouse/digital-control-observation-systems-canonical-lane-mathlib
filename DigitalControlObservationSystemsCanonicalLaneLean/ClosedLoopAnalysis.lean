import DigitalControlObservationCanonicalLaneLean.ObserverDesign

namespace HautevilleHouse
namespace DigitalControlObservationCanonicalLaneLean

structure ClosedLoopPackage {A : AdmissibleClass} {O : ObservationDynamicsPackage A} {C : ControlLawPackage O}
    (Obs : ObserverPackage C) where
  closedLoopDynamics : A.object.stateSpace × A.object.stateSpace → A.object.stateSpace × A.object.stateSpace
  stabilityGuarantee : Prop
  performanceMetric : Prop

structure ClosedLoopEvidence {A : AdmissibleClass} {O : ObservationDynamicsPackage A} {C : ControlLawPackage O}
    {Obs : ObserverPackage C} (Cl : ClosedLoopPackage Obs) where
  stabilityClosed : Cl.stabilityGuarantee
  performanceClosed : Cl.performanceMetric

def ClosedLoopClosed {A : AdmissibleClass} {O : ObservationDynamicsPackage A} {C : ControlLawPackage O}
    {Obs : ObserverPackage C} (Cl : ClosedLoopPackage Obs) : Prop :=
  Cl.stabilityGuarantee ∧ Cl.performanceMetric

theorem closed_loop_closed_from_evidence {A : AdmissibleClass} {O : ObservationDynamicsPackage A}
    {C : ControlLawPackage O} {Obs : ObserverPackage C} (Cl : ClosedLoopPackage Obs)
    (E : ClosedLoopEvidence Cl) : ClosedLoopClosed Cl :=
  And.intro E.stabilityClosed E.performanceClosed

end DigitalControlObservationCanonicalLaneLean
end HautevilleHouse