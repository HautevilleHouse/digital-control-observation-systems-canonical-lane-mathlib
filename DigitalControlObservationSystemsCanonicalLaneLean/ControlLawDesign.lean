import DigitalControlObservationCanonicalLaneLean.ObservationDynamics

namespace HautevilleHouse
namespace DigitalControlObservationCanonicalLaneLean

structure ControlLawPackage {A : AdmissibleClass} (O : ObservationDynamicsPackage A) where
  feedbackLaw : A.object.stateSpace → A.object.controlLaw
  stabilizationProperty : Prop
  optimalityProperty : Prop

structure ControlLawEvidence {A : AdmissibleClass} {O : ObservationDynamicsPackage A} (C : ControlLawPackage O) where
  stabilizationClosed : C.stabilizationProperty
  optimalityClosed : C.optimalityProperty

def ControlLawClosed {A : AdmissibleClass} {O : ObservationDynamicsPackage A} (C : ControlLawPackage O) : Prop :=
  C.stabilizationProperty ∧ C.optimalityProperty

theorem control_law_closed_from_evidence {A : AdmissibleClass} {O : ObservationDynamicsPackage A}
    (C : ControlLawPackage O) (E : ControlLawEvidence C) :
    ControlLawClosed C :=
  And.intro E.stabilizationClosed E.optimalityClosed

end DigitalControlObservationCanonicalLaneLean
end HautevilleHouse