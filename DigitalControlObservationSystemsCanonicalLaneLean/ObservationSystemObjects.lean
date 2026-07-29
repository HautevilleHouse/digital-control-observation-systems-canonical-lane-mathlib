import DigitalControlObservationSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsCanonicalLaneLean

structure DigitalControlSystem where
  stateSpace : Type u
  inputSpace : Type v
  outputSpace : Type w
  dynamics : stateSpace → inputSpace → stateSpace
  observation : stateSpace → outputSpace
  discreteTime : Prop
  continuousTime : Prop

structure ObservableAdmittedObject where
  system : DigitalControlSystem
  observable : Prop
  controllable : Prop
  observableCanonicalForm : Type x
  reachableCanonicalForm : Type y
  kalmanDecompositionExists : Prop
  conclusion : observable ∧ controllable

structure ObservationEndgameState where
  object : ObservableAdmittedObject

def ObservationWitnessClosed (O : ObservableAdmittedObject) : Prop :=
  O.conclusion

end DigitalControlObservationSystemsCanonicalLaneLean
end HautevilleHouse