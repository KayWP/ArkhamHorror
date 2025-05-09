module Arkham.Location.Cards.FacultyOfficesTheHourIsLate (facultyOfficesTheHourIsLate) where

import Arkham.GameValue
import Arkham.Helpers.Modifiers
import Arkham.Location.Cards qualified as Cards (facultyOfficesTheHourIsLate)
import Arkham.Location.Import.Lifted

newtype FacultyOfficesTheHourIsLate = FacultyOfficesTheHourIsLate LocationAttrs
  deriving anyclass IsLocation
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity, HasAbilities)

facultyOfficesTheHourIsLate :: LocationCard FacultyOfficesTheHourIsLate
facultyOfficesTheHourIsLate = symbolLabel $ location FacultyOfficesTheHourIsLate Cards.facultyOfficesTheHourIsLate 2 (Static 0)

instance HasModifiersFor FacultyOfficesTheHourIsLate where
  getModifiersFor (FacultyOfficesTheHourIsLate a) = whenUnrevealed a $ modifySelf a [Blocked]

instance RunMessage FacultyOfficesTheHourIsLate where
  runMessage msg (FacultyOfficesTheHourIsLate attrs) = FacultyOfficesTheHourIsLate <$> runMessage msg attrs
