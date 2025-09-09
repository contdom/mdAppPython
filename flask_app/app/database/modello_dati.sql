--
-- File generato con SQLiteStudio v3.4.17 su ven set 5 09:26:34 2025
--
-- Codifica del testo utilizzata: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabella: rfi_codice
CREATE TABLE IF NOT EXISTS rfi_codice (id INTEGER PRIMARY KEY AUTOINCREMENT, rfi_codice TEXT UNIQUE);

-- Tabella: rfi_codice_pset
CREATE TABLE IF NOT EXISTS "rfi_codice_pset" (
	"id"	INTEGER,
	"rfi_codice_id"	INTEGER,
	"rfi_pset_id"	INTEGER,
	"rfi_fase_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("rfi_codice_id") REFERENCES "rfi_codice"("id"),
	FOREIGN KEY("rfi_fase_id") REFERENCES "rfi_fase"("id"),
	FOREIGN KEY("rfi_pset_id") REFERENCES "rfi_pset"("id")
);

-- Tabella: rfi_elementi
CREATE TABLE IF NOT EXISTS "rfi_elementi" (
	"id"	INTEGER,
	"rfi_nome"	TEXT UNIQUE,
	"rfi_codtipo"	TEXT UNIQUE,
	"rfi_codice_id"	INTEGER UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("rfi_codice_id") REFERENCES "rfi_codice"("id")
);

-- Tabella: rfi_fase
CREATE TABLE IF NOT EXISTS rfi_fase (id INTEGER PRIMARY KEY AUTOINCREMENT, rfi_fase TEXT UNIQUE, ordine INTEGER);

-- Tabella: rfi_parametri
CREATE TABLE IF NOT EXISTS "rfi_parametri" (
	"id"	INTEGER,
	"nome_parametro"	TEXT UNIQUE,
	"tipo"	TEXT,
	"istanza_tipo"	TEXT,
	"um_id"	INTEGER,
	"regola"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("um_id") REFERENCES "unita_misura"("id")
);
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (1, 'RFI_Nome', 'IFCTEXT', NULL, NULL, '^Accessori|AccessoriCondotti|Aiuole|Anello|ApparecchiAllarmiAntincendio|Apparecchiature|ApparecchiatureAT|ApparecchiatureTensioniLC|ApparecchiBT|ApparecchiDiAppoggio|ApparecchiDiIlluminazione|ApparecchiElettriciEComponenti|ApparecchiTVCC|ArcoRovescio|Area|Arginelli|Arredi|AscensoriEScaleMobili|Baggioli|Ballast|BarriereAntirumore|BarriereDiSicurezza|Base|BaseBinder|Binder|Bitume|Bocchettoni|Boiler|Calotta|Canalette|Canali|CanaliFlessibili|CanalinaPortacavi|Cancelli|Cantierizzazioni|Cassette|Centine|Chiodature|Collettori|Compartimentazioni|ConcioDiBase|Condotte|Condotti|ConduttoreInTubo|ConsolidamentiScavi|ConsolidamentiVTR|ControlloAccessi|Contropareti|Controsoffitti|Controventi|CoperchioCanalette|Cordame|Cordoli|CorpiIlluminanti|Cunette|DenteDarresto|Diaframmi|Diffusori|Dima|Drenaggi|DrenaggiATergo|DrenaggiImpermeabilizzazioni|DrenaggiPozzetti|Edifici|Estintori|FacciateContinue|FacciateVentilate|Finestre|Finiture|FondazioneSciolta|Fondazioni|FoniaDati|FossiDiGuardia|Geogriglie|Geotessile|Giunti|GiuntoElastomerico|GradiniEPianerottoli|Griglie|Idranti|Impermeabilizzazione|Impermeabilizzazioni|Inerbimenti|Infilaggi|IniezioniPVC|IsolamentiControterra|IsolamentoCanali|IsolamentoTubazioni|IsolatoriSismici|JetGrouting|LineeAeree|LineeSottoservizi|Locali|Macchine|Magrone|MantoDiCopertura|Marciapiede|MarciapiedeFFP|MarciapiedeGrigliato|Massetti|MaterialeDrenante|Micropali|MistoCementato|ModuloElettrico|Monitor|MuratureASecco|Muretta|Muri|MuriDiContenimento|MuriParaballast |MuroAndatoreSpalla|MuroFrontale|MuroPosteriore|Nicchie|Palancole|Pali|PaliPlastici|PaloDiSostegno|Paraghiaia|Parapetti|Paraurti|Parcheggi|Partizioni|PassaggiBimodali|Passerella|Pavimentazione|Penduli|PercorsiTattili|Piantumazioni|Piastre|PiastrePuntoni|PiastreTiranti|Piedritti|Pilastri|Pile|Platee|Pluviali|PompeEApparecchiature|Portali|PortaliLaterali|PorteEsterne|PorteInterne|Pozzetti|Predalles|PreseInterruttoriSwitch|Pulvini|Puntoni|Quadri|Raccordo|Recinzioni|Riempimenti|RiempimentiATergo|Ringhiere|RinghiereEParapetti|RitegnoSismico|Rivestimenti|Rotaie|Scale|Scatolare|Scavi|ScaviInRoccia|ScaviInTerra|Schermature|ScossalineEConverse|Segnaletica|SegnaleticheVerticali|SelleTBM|Setti|SistemazioniAVerde|SistemazioniIdrauliche|Solai|SolaiSuCasseri|Soletta|SolettaCA|Sospensioni|SostegnoConci|Sottofondi|Sprinkler|SpritzBeton|Stradello|Subballast|Supercompattato|Superfici|SuperficieDTM|Tamponature|TerminaliAria|TerminaliLavello|TerminaliVaso|Termostato|TerrenoVegetale|Tiranti|Tombino|Trasformatori|Traverse|Traversi|Travi|TraviCAP|TraviDiCoronamento|TraviDiRipartizione|TraviRovesce|TraviSecondarie|Tubazioni|TubazioniPerCanalizzazioniBT|TubazioniPerCanalizzazioniMT|TubiDiDrenaggio|TubiProtettivi|Usura|VascheCA|VascheDispersione|Velette|Vuoti|Zoccolini$');
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (2, 'RFI_Codice', 'IFCTEXT|IFCLABEL', NULL, NULL, '^PS\d+$');
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (3, 'RFI_CodTipo', 'IFCTEXT|IFCLABEL', NULL, NULL, '^[A-Z]{3}$');
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (4, 'RFI_WBS7', 'IFCTEXT|IFCLABEL', NULL, NULL, '^[A-Z]{2}\d{2}$');
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (5, 'RFI_WBS8', 'IFCTEXT|IFCLABEL', NULL, NULL, '^([A-Z]{2}\d{2}[A-Z\d])|(00000)$');
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (6, 'RFI_WBS9', 'IFCTEXT|IFCLABEL', NULL, NULL, '^([A-Z]{2}\d)|(000)$');
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (7, 'RFI_FaseRealizzativa', 'IFCTEXT|IFCLABEL', NULL, NULL, '^Definitiva|Provvisoria$');
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (8, 'RFI_IDCronoprogramma', 'IFCTEXT|IFCLABEL', NULL, NULL, '.+');
INSERT INTO rfi_parametri (id, nome_parametro, tipo, istanza_tipo, um_id, regola) VALUES (9, 'RFI_Rev', 'IFCTEXT|IFCLABEL', NULL, NULL, '^[A-Z]$');

-- Tabella: rfi_pset
CREATE TABLE IF NOT EXISTS "rfi_pset" (
	"id"	INTEGER,
	"rfi_pset"	TEXT UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO rfi_pset (id, rfi_pset) VALUES (1, 'A01_Pset_Codifica');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (2, 'A02_Pset_AnagraficaStrutture');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (3, 'A03_Pset_GeneraleGallerie');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (4, 'A04_Pset_Locali');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (5, 'A08_Pset_Economico');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (6, 'A09_Pset_Costruttivo');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (7, 'A10_Pset_Gestione');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (8, 'A11_Pset_EdificiEsistenti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (9, 'A12_Pset_LineeEsistenti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (10, 'A13_Pset_Materiale');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (11, 'A14_Pset_Cantierizzazioni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (12, 'A15_Pset_SottoserviziEsistenti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (13, 'B01_Pset_CementoArmato');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (14, 'B02_Pset_CalcestruzzoMagro');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (15, 'B03_Pset_Acciaio');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (16, 'B04_Pset_Micropali');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (17, 'B05_Pset_Tiranti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (18, 'B06_Pset_SpritzBeton');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (19, 'B07_Pset_Iniezioni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (20, 'B08_Pset_Infilaggio');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (21, 'B09_Pset_Chiodature');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (22, 'B10_Pset_Centine');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (23, 'B11_Pset_Impermeabilizzazioni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (24, 'B12_Pset_Geotessile');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (25, 'B13_Pset_Scavi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (26, 'B14_Pset_Palancole');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (27, 'B15_Pset_TubiVetroresina');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (28, 'B16_Pset_Pali');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (29, 'B17_Pset_TubiDrenaggio');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (30, 'B18_Pset_JetGrouting');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (31, 'B19_Pset_Consolidamento');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (32, 'B20_Pset_Grigliati');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (33, 'B21_Pset_DrenaggioATergo');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (34, 'B22_Pset_Canaletta');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (35, 'B23_Pset_CementoArmatoPrecompresso');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (36, 'B24_Pset_Geogriglia');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (37, 'B25_Pset_Anello');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (38, 'B26_Pset_Impalcato');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (39, 'B27_Pset_TraveDiRipartizione');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (40, 'B28_Pset_PiastreTiranti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (41, 'B29_Pset_Puntoni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (42, 'B30_Pset_PiastrePuntoni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (43, 'B31_Pset_Sottostrutture');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (44, 'C01_Pset_BarriereAntirumore');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (45, 'C02_Pset_Tubazioni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (46, 'C03_Pset_Bocchettoni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (47, 'C04_Pset_OpereAVerde');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (48, 'C05_Pset_Piantumazioni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (49, 'D01_Pset_Infissi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (50, 'D02_Pset_Porte');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (51, 'D03_Pset_SistemazioniVerdi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (52, 'D04_Pset_Cancelli');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (53, 'D05_Pset_Ringhiere');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (54, 'D06_Pset_Recinzioni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (55, 'D07_Pset_Pluviali');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (56, 'D08_Pset_Pozzetto');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (57, 'D09_Pset_ScossalineGrondaie');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (58, 'D10_Pset_Muri');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (59, 'D11_Pset_Finiture');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (60, 'D12_Pset_Sottofondi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (61, 'E01_Pset_Canali');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (62, 'E02_Pset_Condotte');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (63, 'E03_Pset_Pozzetti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (64, 'E04_Pset_SistemazioniIdrauliche');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (65, 'E05_Pset_VascheDispersione');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (66, 'E06_Pset_VascheCA');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (67, 'E07_Pset_Fossi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (68, 'F01_Pset_Sensori');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (69, 'F02_Pset_MotoriElettrici');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (70, 'F03_Pset_Comandi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (71, 'F04_Pset_PreseInterruttoriSwitch');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (72, 'F05_Pset_ApparecchiElettrici');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (73, 'F06_Pset_Estintori');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (74, 'F07_Pset_Sprinkler');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (75, 'F08_Pset_Idranti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (76, 'F09_Pset_Naspi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (77, 'F10_Pset_CorpiIlluminanti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (78, 'F11_Pset_ApparecchiIlluminazione');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (79, 'F12_Pset_Valvole');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (80, 'F13_Pset_Ascensori');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (81, 'F14_Pset_TerminaleAria');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (82, 'F15_Pset_CondottiCanali');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (83, 'F16_Pset_AccessoriCondotti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (84, 'F17_Pset_MacchineCondizionamento');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (85, 'F18_Pset_Tubazioni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (86, 'F19_Pset_ApparecchiatureIdriche');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (87, 'F20_Pset_TerminaliLavello');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (88, 'F21_Pset_TerminaliVaso');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (89, 'F22_Pset_ImpiantoTerra');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (90, 'F23_Pset_CanalinePassacavi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (91, 'F24_Pset_Quadri');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (92, 'F25_Pset_Trasformatori');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (93, 'G01_Pset_PaloDiSostegno');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (94, 'G02_Pset_PenduliGalleria');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (95, 'G03_Pset_Portali');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (96, 'G04_Pset_Sospensioni');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (97, 'H01_Pset_Arginello');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (98, 'H02_Pset_Ballast');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (99, 'H03_Pset_BarriereSicurezza');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (100, 'H04_Pset_Base');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (101, 'H05_Pset_Binder');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (102, 'H06_Pset_Canaletta');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (103, 'H07_Pset_CanalinaPortacavi');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (104, 'H08_Pset_Cordolo');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (105, 'H09_Pset_Cunetta');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (106, 'H10_Pset_Fondazione');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (107, 'H11_Pset_PassaggiBimodali');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (108, 'H12_Pset_Recinzione');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (109, 'H13_Pset_Rotaie');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (110, 'H14_Pset_SegnaleticaVerticale');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (111, 'H15_Pset_Subballast');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (112, 'H16_Pset_Supercompattato');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (113, 'H17_Pset_Traverse');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (114, 'H18_Pset_Usura');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (115, 'H19_Pset_Inerbimento');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (116, 'H20_Pset_Paraurti');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (117, 'H21_Pset_MistoCementato');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (118, 'H22_Pset_BaseBinder');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (119, 'H23_Pset_Finiture');
INSERT INTO rfi_pset (id, rfi_pset) VALUES (120, 'H24_Pset_Marciapiede');

-- Tabella: rfi_pset_parametri
CREATE TABLE IF NOT EXISTS "rfi_pset_parametri" (
	"id"	INTEGER,
	"rfi_pset_id"	INTEGER,
	"nome_parametro_id"	INTEGER,
	"rfi_fase_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("nome_parametro_id") REFERENCES "rfi_parametri"("id"),
	FOREIGN KEY("rfi_fase_id") REFERENCES "rfi_fase"("id"),
	FOREIGN KEY("rfi_pset_id") REFERENCES "rfi_pset"("id")
);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (1, 1, 1, NULL);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (2, 1, 2, NULL);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (3, 1, 3, NULL);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (4, 1, 4, NULL);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (5, 1, 5, NULL);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (6, 1, 6, NULL);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (7, 1, 7, NULL);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (8, 1, 8, NULL);
INSERT INTO rfi_pset_parametri (id, rfi_pset_id, nome_parametro_id, rfi_fase_id) VALUES (9, 1, 9, NULL);

-- Tabella: unita_misura
CREATE TABLE IF NOT EXISTS "unita_misura" (
	"id"	INTEGER,
	"unita"	TEXT UNIQUE,
	"simbolo"	TEXT UNIQUE,
	"default_display"	INTEGER UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- Vista: parametri_ids
CREATE VIEW IF NOT EXISTS parametri_ids AS SELECT rfi_pset.rfi_pset AS nome_pset,
       rfi_parametri.nome_parametro,
       rfi_parametri.tipo,
       rfi_parametri.regola
FROM rfi_parametri
INNER JOIN rfi_pset_parametri
    ON rfi_parametri.id = rfi_pset_parametri.nome_parametro_id
INNER JOIN rfi_pset
    ON rfi_pset_parametri.rfi_pset_id = rfi_pset.id;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
