--プログラミング１の課題（簡単救急判断ツールversion1）--

/*簡単救急判断ツール用データ
 学習用。医師による診断の代替ではありません。
PostgreSQL向け*/

BEGIN;

DROP TABLE IF EXISTS symptom_aliases;
DROP TABLE IF EXISTS emergency_symptoms;

CREATE TABLE emergency_symptoms (
    id SERIAL PRIMARY KEY,
    symptom_code VARCHAR(50) UNIQUE NOT NULL,
    canonical_name VARCHAR(100) NOT NULL,
    emergency_level SMALLINT NOT NULL CHECK (emergency_level BETWEEN 0 AND 5),
    category VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    action TEXT NOT NULL,
    enabled BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE symptom_aliases (
    id SERIAL PRIMARY KEY,
    symptom_id INTEGER NOT NULL REFERENCES emergency_symptoms(id) ON DELETE CASCADE,
    alias VARCHAR(150) NOT NULL,
    normalized_alias VARCHAR(150) NOT NULL,
    UNIQUE(symptom_id, normalized_alias)
);

CREATE INDEX idx_symptom_aliases_normalized
    ON symptom_aliases(normalized_alias);


INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('UNCONSCIOUS', '意識がない', 5, '意識', '生命に関わる可能性がある緊急症状です。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '意識がない', '意識がない'
FROM emergency_symptoms WHERE symptom_code = 'UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '意識なし', '意識なし'
FROM emergency_symptoms WHERE symptom_code = 'UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '反応がない', '反応がない'
FROM emergency_symptoms WHERE symptom_code = 'UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '呼びかけに反応しない', '呼びかけに反応しない'
FROM emergency_symptoms WHERE symptom_code = 'UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '返事がない', '返事がない'
FROM emergency_symptoms WHERE symptom_code = 'UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '起こしても起きない', '起こしても起きない'
FROM emergency_symptoms WHERE symptom_code = 'UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ぐったりして反応しない', 'ぐったりして反応しない'
FROM emergency_symptoms WHERE symptom_code = 'UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '意識不明', '意識不明'
FROM emergency_symptoms WHERE symptom_code = 'UNCONSCIOUS';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('NO_BREATH', '呼吸していない', 5, '呼吸', '心肺停止の可能性がある緊急症状です。', '直ちに119番へ通報し、指令員の指示に従ってください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '呼吸していない', '呼吸していない'
FROM emergency_symptoms WHERE symptom_code = 'NO_BREATH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息をしていない', '息をしていない'
FROM emergency_symptoms WHERE symptom_code = 'NO_BREATH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息してない', '息してない'
FROM emergency_symptoms WHERE symptom_code = 'NO_BREATH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '呼吸がない', '呼吸がない'
FROM emergency_symptoms WHERE symptom_code = 'NO_BREATH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息がない', '息がない'
FROM emergency_symptoms WHERE symptom_code = 'NO_BREATH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸が動いていない', '胸が動いていない'
FROM emergency_symptoms WHERE symptom_code = 'NO_BREATH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '呼吸停止', '呼吸停止'
FROM emergency_symptoms WHERE symptom_code = 'NO_BREATH';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('ABNORMAL_BREATH_UNCONSCIOUS', '普段どおりの呼吸がなく反応もない', 5, '呼吸', '心停止が疑われる緊急状態です。', '直ちに119番へ通報し、指令員の指示に従ってください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '普段どおりの呼吸がない', '普段どおりの呼吸がない'
FROM emergency_symptoms WHERE symptom_code = 'ABNORMAL_BREATH_UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '変な呼吸で反応がない', '変な呼吸で反応がない'
FROM emergency_symptoms WHERE symptom_code = 'ABNORMAL_BREATH_UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'あえぐだけ', 'あえぐだけ'
FROM emergency_symptoms WHERE symptom_code = 'ABNORMAL_BREATH_UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '死戦期呼吸', '死戦期呼吸'
FROM emergency_symptoms WHERE symptom_code = 'ABNORMAL_BREATH_UNCONSCIOUS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'しゃくりあげるような呼吸', 'しゃくりあげるような呼吸'
FROM emergency_symptoms WHERE symptom_code = 'ABNORMAL_BREATH_UNCONSCIOUS';

