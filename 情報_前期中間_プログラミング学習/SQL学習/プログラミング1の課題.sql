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

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SEVERE_DYSPNEA', '強い呼吸困難', 5, '呼吸', '重い呼吸障害の可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '呼吸困難', '呼吸困難'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息ができない', '息ができない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息できない', '息できない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息が吸えない', '息が吸えない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息が吐けない', '息が吐けない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息苦しくて話せない', '息苦しくて話せない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '呼吸が非常に苦しい', '呼吸が非常に苦しい'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '窒息しそう', '窒息しそう'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息が止まりそう', '息が止まりそう'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DYSPNEA';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('CYANOSIS', '唇や顔が青紫色', 5, '呼吸', '酸素不足の可能性がある緊急症状です。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '唇が青い', '唇が青い'
FROM emergency_symptoms WHERE symptom_code = 'CYANOSIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'くちびるが青い', 'くちびるが青い'
FROM emergency_symptoms WHERE symptom_code = 'CYANOSIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '顔が青紫', '顔が青紫'
FROM emergency_symptoms WHERE symptom_code = 'CYANOSIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '紫色の唇', '紫色の唇'
FROM emergency_symptoms WHERE symptom_code = 'CYANOSIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'チアノーゼ', 'チアノーゼ'
FROM emergency_symptoms WHERE symptom_code = 'CYANOSIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '顔色が青い', '顔色が青い'
FROM emergency_symptoms WHERE symptom_code = 'CYANOSIS';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('CHOKING', '物をのどに詰まらせた', 5, '窒息', '気道が塞がれている可能性があります。', '直ちに119番へ通報し、指令員の指示に従ってください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '喉に詰まった', '喉に詰まった'
FROM emergency_symptoms WHERE symptom_code = 'CHOKING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'のどに詰まった', 'のどに詰まった'
FROM emergency_symptoms WHERE symptom_code = 'CHOKING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '食べ物を詰まらせた', '食べ物を詰まらせた'
FROM emergency_symptoms WHERE symptom_code = 'CHOKING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '異物を詰まらせた', '異物を詰まらせた'
FROM emergency_symptoms WHERE symptom_code = 'CHOKING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '窒息', '窒息'
FROM emergency_symptoms WHERE symptom_code = 'CHOKING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '声が出ない', '声が出ない'
FROM emergency_symptoms WHERE symptom_code = 'CHOKING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '咳ができない', '咳ができない'
FROM emergency_symptoms WHERE symptom_code = 'CHOKING';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SEVERE_CHEST_PAIN', '突然の強い胸痛', 5, '胸部', '心臓や大血管の緊急疾患の可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '突然の胸痛', '突然の胸痛'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_CHEST_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸が激しく痛い', '胸が激しく痛い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_CHEST_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸の激痛', '胸の激痛'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_CHEST_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸が締め付けられる', '胸が締め付けられる'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_CHEST_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸が圧迫される', '胸が圧迫される'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_CHEST_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸をつかまれる感じ', '胸をつかまれる感じ'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_CHEST_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸の中央が痛い', '胸の中央が痛い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_CHEST_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸痛が続く', '胸痛が続く'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_CHEST_PAIN';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('CHEST_BACK_MIGRATING', '胸や背中の突然の痛み', 5, '胸部', '大血管などの緊急疾患の可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸から背中が痛い', '胸から背中が痛い'
FROM emergency_symptoms WHERE symptom_code = 'CHEST_BACK_MIGRATING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '背中の突然の激痛', '背中の突然の激痛'
FROM emergency_symptoms WHERE symptom_code = 'CHEST_BACK_MIGRATING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胸の痛みが背中へ移る', '胸の痛みが背中へ移る'
FROM emergency_symptoms WHERE symptom_code = 'CHEST_BACK_MIGRATING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '痛む場所が移動する', '痛む場所が移動する'
FROM emergency_symptoms WHERE symptom_code = 'CHEST_BACK_MIGRATING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '裂けるような背中の痛み', '裂けるような背中の痛み'
FROM emergency_symptoms WHERE symptom_code = 'CHEST_BACK_MIGRATING';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('STROKE_FACE', '突然の顔のゆがみ', 5, '脳神経', '脳卒中の可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '顔がゆがむ', '顔がゆがむ'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_FACE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '口元がゆがむ', '口元がゆがむ'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_FACE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '顔半分が動かない', '顔半分が動かない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_FACE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '片方の顔がしびれる', '片方の顔がしびれる'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_FACE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '笑うと片側が下がる', '笑うと片側が下がる'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_FACE';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('STROKE_SPEECH', '突然ろれつが回らない', 5, '脳神経', '脳卒中の可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ろれつが回らない', 'ろれつが回らない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_SPEECH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ろれつ回らん', 'ろれつ回らん'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_SPEECH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '言葉が出ない', '言葉が出ない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_SPEECH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'うまく話せない', 'うまく話せない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_SPEECH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急にしゃべれない', '急にしゃべれない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_SPEECH';


INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '言っていることがおかしい', '言っていることがおかしい'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_SPEECH';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('STROKE_LIMB', '突然片側の手足に力が入らない', 5, '脳神経', '脳卒中の可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '片方の腕に力が入らない', '片方の腕に力が入らない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_LIMB';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '片足に力が入らない', '片足に力が入らない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_LIMB';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '半身が動かない', '半身が動かない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_LIMB';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '片側がしびれる', '片側がしびれる'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_LIMB';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急に手足が動かない', '急に手足が動かない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_LIMB';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '片腕が上がらない', '片腕が上がらない'
FROM emergency_symptoms WHERE symptom_code = 'STROKE_LIMB';

