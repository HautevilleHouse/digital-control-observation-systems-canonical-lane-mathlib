import DigitalControlObservationCanonicalLaneLean.ControlLawDesign

namespace HautevilleHouse
namespace DigitalControlObservationCanonicalLaneLean

structure ObserverPackage {A : AdmissibleClass} {O : ObservationDynamicsPackage A} (C : ControlLawPackage O) where
  observerDynamics : A.object.stateSpace → A.object.observationMap → A.object.stateSpace
  convergenceProperty : Prop
  robustnessProperty : Prop

structure ObserverEvidence {A : AdmissibleClass} {O : ObservationDynamicsPackage A} {C : ControlLawPackage O}
    (Obs : ObserverPackage C) where
  convergenceClosed : Obs.convergenceProperty
  robustnessClosed : Obs.robustnessProperty

def ObserverClosed {A : AdmissibleClass} {O : ObservationDynamicsPackage A} {C : ControlLawPackage O}
    (Obs : ObserverPackage C) : Prop :=
  Obs.convergenceProperty ∧ Obs.robustnessProperty

theorem observer_closed_from_evidence {A : AdmissibleClass} {O : ObservationDynamicsPackage A}
    {C : ControlLawPackage O} (Obs : ObserverPackage C) (E : ObserverEvidence Obs) :
    ObserverClosed Obs :=
  And.intro E.convergenceClosed E.robustnessClosed

end DigitalControlObservationCanonicalLaneLean
end HautevilleHouse