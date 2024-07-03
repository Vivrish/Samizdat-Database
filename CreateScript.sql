-- Remove conflicting tables
DROP TABLE IF EXISTS adresa CASCADE;
DROP TABLE IF EXISTS basnik CASCADE;
DROP TABLE IF EXISTS budova CASCADE;
DROP TABLE IF EXISTS festival_knih CASCADE;
DROP TABLE IF EXISTS kontrola CASCADE;
DROP TABLE IF EXISTS obchod CASCADE;
DROP TABLE IF EXISTS oteviraci_doba CASCADE;
DROP TABLE IF EXISTS policista CASCADE;
DROP TABLE IF EXISTS schuzka_basniku CASCADE;
DROP TABLE IF EXISTS spisovatel CASCADE;
DROP TABLE IF EXISTS tvurce CASCADE;
DROP TABLE IF EXISTS zbozi CASCADE;
DROP TABLE IF EXISTS schuzka_basniku_basnik CASCADE;
DROP TABLE IF EXISTS spisovatel_festival_knih CASCADE;
DROP TABLE IF EXISTS zbozi_tvurce CASCADE;
-- End of removing

CREATE TABLE adresa (
    adresa_id SERIAL NOT NULL,
    mesto VARCHAR(40) NOT NULL,
    ulice VARCHAR(40) NOT NULL,
    cislo_popisne VARCHAR(30) NOT NULL
);
ALTER TABLE adresa ADD CONSTRAINT pk_adresa PRIMARY KEY (adresa_id);

CREATE TABLE basnik (
    tvurce_id INTEGER NOT NULL
);
ALTER TABLE basnik ADD CONSTRAINT pk_basnik PRIMARY KEY (tvurce_id);

CREATE TABLE budova (
    budova_id SERIAL NOT NULL,
    adresa_id INTEGER NOT NULL,
    oteviraci_doba_id INTEGER NOT NULL,
    cena DECIMAL(6, 2) NOT NULL,
    kapacita INTEGER NOT NULL
);
ALTER TABLE budova ADD CONSTRAINT pk_budova PRIMARY KEY (budova_id);
ALTER TABLE budova ADD CONSTRAINT u_fk_budova_adresa UNIQUE (adresa_id);

CREATE TABLE festival_knih (
    festival_knih_id SERIAL NOT NULL,
    budova_id INTEGER NOT NULL,
    datum DATE NOT NULL,
    cas TIME NOT NULL
);
ALTER TABLE festival_knih ADD CONSTRAINT pk_festival_knih PRIMARY KEY (festival_knih_id);

CREATE TABLE kontrola (
    kontrola_id SERIAL NOT NULL,
    budova_id INTEGER NOT NULL,
    policista_id INTEGER NOT NULL,
    datum DATE NOT NULL,
    cas TIME NOT NULL
);
ALTER TABLE kontrola ADD CONSTRAINT pk_kontrola PRIMARY KEY (kontrola_id);

CREATE TABLE obchod (
    obchod_id SERIAL NOT NULL,
    nazev VARCHAR(50) NOT NULL
);
ALTER TABLE obchod ADD CONSTRAINT pk_obchod PRIMARY KEY (obchod_id);

CREATE TABLE oteviraci_doba (
    oteviraci_doba_id SERIAL NOT NULL,
    od TIME NOT NULL,
    doo TIME NOT NULL,
    do_den_v_tydnu INTEGER NOT NULL,
    od_den_v_tydnu INTEGER NOT NULL
);
ALTER TABLE oteviraci_doba ADD CONSTRAINT pk_oteviraci_doba PRIMARY KEY (oteviraci_doba_id);

CREATE TABLE policista (
    policista_id SERIAL NOT NULL,
    jmeno VARCHAR(40) NOT NULL,
    prijmeni VARCHAR(40) NOT NULL,
    datum_narozeni DATE,
    je_uplatny BOOLEAN NOT NULL
);
ALTER TABLE policista ADD CONSTRAINT pk_policista PRIMARY KEY (policista_id);

CREATE TABLE schuzka_basniku (
    schuzka_basniku_id SERIAL NOT NULL,
    budova_id INTEGER NOT NULL,
    datum DATE NOT NULL,
    cas TIME NOT NULL
);
ALTER TABLE schuzka_basniku ADD CONSTRAINT pk_schuzka_basniku PRIMARY KEY (schuzka_basniku_id);

CREATE TABLE spisovatel (
    tvurce_id INTEGER NOT NULL
);
ALTER TABLE spisovatel ADD CONSTRAINT pk_spisovatel PRIMARY KEY (tvurce_id);

CREATE TABLE tvurce (
    tvurce_id SERIAL NOT NULL,
    jmeno VARCHAR(30) NOT NULL,
    prijmeni VARCHAR(30) NOT NULL,
    datum_narozeni DATE
);
ALTER TABLE tvurce ADD CONSTRAINT pk_tvurce PRIMARY KEY (tvurce_id);

CREATE TABLE zbozi (
    zbozi_id SERIAL NOT NULL,
    obchod_id INTEGER NOT NULL,
    nazev VARCHAR(150) NOT NULL,
    styl VARCHAR(40),
    rok_napsani INTEGER,
    typ VARCHAR(40) NOT NULL,
    cena DECIMAL(5, 2) NOT NULL,
    velikost INTEGER NOT NULL
);
ALTER TABLE zbozi ADD CONSTRAINT pk_zbozi PRIMARY KEY (zbozi_id);

CREATE TABLE schuzka_basniku_basnik (
    schuzka_basniku_id INTEGER NOT NULL,
    tvurce_id INTEGER NOT NULL
);
ALTER TABLE schuzka_basniku_basnik ADD CONSTRAINT pk_schuzka_basniku_basnik PRIMARY KEY (schuzka_basniku_id, tvurce_id);

CREATE TABLE spisovatel_festival_knih (
    tvurce_id INTEGER NOT NULL,
    festival_knih_id INTEGER NOT NULL
);
ALTER TABLE spisovatel_festival_knih ADD CONSTRAINT pk_spisovatel_festival_knih PRIMARY KEY (tvurce_id, festival_knih_id);

CREATE TABLE zbozi_tvurce (
    zbozi_id INTEGER NOT NULL,
    tvurce_id INTEGER NOT NULL
);
ALTER TABLE zbozi_tvurce ADD CONSTRAINT pk_zbozi_tvurce PRIMARY KEY (zbozi_id, tvurce_id);

ALTER TABLE basnik ADD CONSTRAINT fk_basnik_tvurce FOREIGN KEY (tvurce_id) REFERENCES tvurce (tvurce_id) ON DELETE CASCADE;

ALTER TABLE budova ADD CONSTRAINT fk_budova_adresa FOREIGN KEY (adresa_id) REFERENCES adresa (adresa_id) ON DELETE CASCADE;
ALTER TABLE budova ADD CONSTRAINT fk_budova_oteviraci_doba FOREIGN KEY (oteviraci_doba_id) REFERENCES oteviraci_doba (oteviraci_doba_id) ON DELETE CASCADE;

ALTER TABLE festival_knih ADD CONSTRAINT fk_festival_knih_budova FOREIGN KEY (budova_id) REFERENCES budova (budova_id) ON DELETE CASCADE;

ALTER TABLE kontrola ADD CONSTRAINT fk_kontrola_budova FOREIGN KEY (budova_id) REFERENCES budova (budova_id) ON DELETE CASCADE;
ALTER TABLE kontrola ADD CONSTRAINT fk_kontrola_policista FOREIGN KEY (policista_id) REFERENCES policista (policista_id) ON DELETE CASCADE;

ALTER TABLE schuzka_basniku ADD CONSTRAINT fk_schuzka_basniku_budova FOREIGN KEY (budova_id) REFERENCES budova (budova_id) ON DELETE CASCADE;

ALTER TABLE spisovatel ADD CONSTRAINT fk_spisovatel_tvurce FOREIGN KEY (tvurce_id) REFERENCES tvurce (tvurce_id) ON DELETE CASCADE;

ALTER TABLE zbozi ADD CONSTRAINT fk_zbozi_obchod FOREIGN KEY (obchod_id) REFERENCES obchod (obchod_id) ON DELETE CASCADE;

ALTER TABLE schuzka_basniku_basnik ADD CONSTRAINT fk_schuzka_basniku_basnik_schuz FOREIGN KEY (schuzka_basniku_id) REFERENCES schuzka_basniku (schuzka_basniku_id) ON DELETE CASCADE;
ALTER TABLE schuzka_basniku_basnik ADD CONSTRAINT fk_schuzka_basniku_basnik_basni FOREIGN KEY (tvurce_id) REFERENCES basnik (tvurce_id) ON DELETE CASCADE;

ALTER TABLE spisovatel_festival_knih ADD CONSTRAINT fk_spisovatel_festival_knih_spi FOREIGN KEY (tvurce_id) REFERENCES spisovatel (tvurce_id) ON DELETE CASCADE;
ALTER TABLE spisovatel_festival_knih ADD CONSTRAINT fk_spisovatel_festival_knih_fes FOREIGN KEY (festival_knih_id) REFERENCES festival_knih (festival_knih_id) ON DELETE CASCADE;

ALTER TABLE zbozi_tvurce ADD CONSTRAINT fk_zbozi_tvurce_zbozi FOREIGN KEY (zbozi_id) REFERENCES zbozi (zbozi_id) ON DELETE CASCADE;
ALTER TABLE zbozi_tvurce ADD CONSTRAINT fk_zbozi_tvurce_tvurce FOREIGN KEY (tvurce_id) REFERENCES tvurce (tvurce_id) ON DELETE CASCADE;

