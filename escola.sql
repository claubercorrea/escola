-- -----------------------------------------------------
-- Schema escola
-- Projeto: Modelagem de Banco de Dados Escolar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 ;
USE `escola` ;

-- -----------------------------------------------------
-- Table `escola`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`alunos` (
  `idalunos` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(45) NULL,
  `idade` INT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idalunos`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `escola`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`disciplina` (
  `id_disciplina` INT NOT NULL AUTO_INCREMENT,
  `nome_disciplina` VARCHAR(45) NULL,
  PRIMARY KEY (`id_disciplina`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `escola`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`turma` (
  `idturma` INT NOT NULL AUTO_INCREMENT,
  `nome_turma` VARCHAR(45) NULL,
  `disciplina_id_disciplina` INT NOT NULL,
  PRIMARY KEY (`idturma`, `disciplina_id_disciplina`),
  INDEX `fk_turma_disciplina1_idx` (`disciplina_id_disciplina` ASC),
  CONSTRAINT `fk_turma_disciplina1`
    FOREIGN KEY (`disciplina_id_disciplina`)
    REFERENCES `escola`.`disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `escola`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`professor` (
  `idprofessor` INT NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(45) NULL,
  `disciplina` VARCHAR(45) NULL,
  `alunos_idalunos` INT NOT NULL,
  `turma_idturma` INT NOT NULL,
  `turma_disciplina_id_disciplina` INT NOT NULL,
  PRIMARY KEY (`idprofessor`),
  INDEX `fk_professor_alunos1_idx` (`alunos_idalunos` ASC),
  INDEX `fk_professor_turma1_idx` (`turma_idturma` ASC, `turma_disciplina_id_disciplina` ASC),
  CONSTRAINT `fk_professor_alunos1`
    FOREIGN KEY (`alunos_idalunos`)
    REFERENCES `escola`.`alunos` (`idalunos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_turma1`
    FOREIGN KEY (`turma_idturma` , `turma_disciplina_id_disciplina`)
    REFERENCES `escola`.`turma` (`idturma` , `disciplina_id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
