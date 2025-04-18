module Arkham.Location.Cards.OrneLibrary (orneLibrary) where

import Arkham.Cost
import Arkham.GameValue
import Arkham.Helpers.Modifiers
import Arkham.Location.Cards qualified as Cards (orneLibrary)
import Arkham.Location.Import.Lifted

newtype OrneLibrary = OrneLibrary LocationAttrs
  deriving anyclass IsLocation
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity, HasAbilities)

orneLibrary :: LocationCard OrneLibrary
orneLibrary = symbolLabel $ location OrneLibrary Cards.orneLibrary 3 (PerPlayer 1)

instance HasModifiersFor OrneLibrary where
  getModifiersFor (OrneLibrary a) = whenRevealed a $ modifySelf a [AdditionalCostToInvestigate (ActionCost 1)]

instance RunMessage OrneLibrary where
  runMessage msg (OrneLibrary attrs) = OrneLibrary <$> runMessage msg attrs
