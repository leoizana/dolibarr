-- ============================================================================
-- Copyright (C) 2005 Laurent Destailleur <eldy@users.sourceforge.net>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <https://www.gnu.org/licenses/>.
--
-- ============================================================================


ALTER TABLE llx_c_departements ADD UNIQUE uk_departements (code_departement,fk_region);

ALTER TABLE llx_c_departements ADD INDEX idx_departements_fk_region (fk_region);

-- NOTE: We duplicate creation of unique keys on llx_c_regions NOW to be able to create foreign keys.
-- This may generate a warning "Duplicate key name 'uk_code_region'" to ignore
ALTER TABLE llx_c_regions ADD UNIQUE INDEX uk_code_region (code_region);

ALTER TABLE llx_c_departements ADD CONSTRAINT fk_departements_fk_region	FOREIGN KEY (fk_region) REFERENCES llx_c_regions (code_region);
