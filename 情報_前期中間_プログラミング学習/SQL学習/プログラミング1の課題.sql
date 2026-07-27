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

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SUDDEN_VISION', '突然の視覚異常', 5, '脳神経', '脳や目の緊急疾患の可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '突然見えない', '突然見えない'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_VISION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急に目が見えない', '急に目が見えない'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_VISION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '視野が狭い', '視野が狭い'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_VISION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '二重に見える', '二重に見える'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_VISION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急に物が二つに見える', '急に物が二つに見える'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_VISION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '片目が見えない', '片目が見えない'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_VISION';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SUDDEN_SEVERE_HEADACHE', '突然の激しい頭痛', 5, '頭部', '脳血管障害などの可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '突然の激しい頭痛', '突然の激しい頭痛'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_SEVERE_HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '今までで一番痛い頭痛', '今までで一番痛い頭痛'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_SEVERE_HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭を殴られたような痛み', '頭を殴られたような痛み'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_SEVERE_HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急な頭痛', '急な頭痛'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_SEVERE_HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭が突然割れそう', '頭が突然割れそう'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_SEVERE_HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '雷が落ちたような頭痛', '雷が落ちたような頭痛'
FROM emergency_symptoms WHERE symptom_code = 'SUDDEN_SEVERE_HEADACHE';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SEIZURE', 'けいれん', 5, '脳神経', '緊急対応が必要な可能性があります。', 'けいれんが続く、繰り返す、意識が戻らない場合は直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'けいれん', 'けいれん'
FROM emergency_symptoms WHERE symptom_code = 'SEIZURE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '痙攣', '痙攣'
FROM emergency_symptoms WHERE symptom_code = 'SEIZURE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ひきつけ', 'ひきつけ'
FROM emergency_symptoms WHERE symptom_code = 'SEIZURE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '体がガクガク', '体がガクガク'
FROM emergency_symptoms WHERE symptom_code = 'SEIZURE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '全身が震えて反応しない', '全身が震えて反応しない'
FROM emergency_symptoms WHERE symptom_code = 'SEIZURE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'けいれんが止まらない', 'けいれんが止まらない'
FROM emergency_symptoms WHERE symptom_code = 'SEIZURE';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('MASSIVE_BLEEDING', '大量出血', 5, '外傷', '失血により危険な状態になる可能性があります。', '可能な範囲で圧迫止血し、直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '大量出血', '大量出血'
FROM emergency_symptoms WHERE symptom_code = 'MASSIVE_BLEEDING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '血が止まらない', '血が止まらない'
FROM emergency_symptoms WHERE symptom_code = 'MASSIVE_BLEEDING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '出血が止まらない', '出血が止まらない'
FROM emergency_symptoms WHERE symptom_code = 'MASSIVE_BLEEDING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '血が噴き出す', '血が噴き出す'
FROM emergency_symptoms WHERE symptom_code = 'MASSIVE_BLEEDING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '血だらけ', '血だらけ'
FROM emergency_symptoms WHERE symptom_code = 'MASSIVE_BLEEDING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '多量に出血', '多量に出血'
FROM emergency_symptoms WHERE symptom_code = 'MASSIVE_BLEEDING';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SEVERE_TRAUMA', '大きな事故や重い外傷', 5, '外傷', '重いけがが隠れている可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '交通事故で強く打った', '交通事故で強く打った'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_TRAUMA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '高い所から落ちた', '高い所から落ちた'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_TRAUMA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '転落した', '転落した'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_TRAUMA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '車にはねられた', '車にはねられた'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_TRAUMA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '体を挟まれた', '体を挟まれた'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_TRAUMA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭を強く打った', '頭を強く打った'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_TRAUMA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '首を強く打った', '首を強く打った'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_TRAUMA';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SEVERE_BURN', '広範囲または重いやけど', 5, 'やけど', '重症熱傷の可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '広範囲のやけど', '広範囲のやけど'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '全身やけど', '全身やけど'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '顔のやけど', '顔のやけど'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '気道熱傷', '気道熱傷'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '煙を吸った', '煙を吸った'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '服が燃えた', '服が燃えた'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '深いやけど', '深いやけど'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BURN';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('ANAPHYLAXIS', '重いアレルギー反応', 5, 'アレルギー', 'アナフィラキシーの可能性があります。', '呼吸困難、のどの腫れ、意識障害があれば直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'アナフィラキシー', 'アナフィラキシー'
FROM emergency_symptoms WHERE symptom_code = 'ANAPHYLAXIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '喉が腫れて息苦しい', '喉が腫れて息苦しい'
FROM emergency_symptoms WHERE symptom_code = 'ANAPHYLAXIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'アレルギーで呼吸困難', 'アレルギーで呼吸困難'
FROM emergency_symptoms WHERE symptom_code = 'ANAPHYLAXIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '全身じんましんと息苦しさ', '全身じんましんと息苦しさ'
FROM emergency_symptoms WHERE symptom_code = 'ANAPHYLAXIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '舌が腫れた', '舌が腫れた'
FROM emergency_symptoms WHERE symptom_code = 'ANAPHYLAXIS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急に顔が腫れた', '急に顔が腫れた'
FROM emergency_symptoms WHERE symptom_code = 'ANAPHYLAXIS';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('POISONING', '中毒の疑い', 5, '中毒', '生命に関わる中毒の可能性があります。', '直ちに119番へ通報し、原因物質が分かれば伝えてください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '薬を大量に飲んだ', '薬を大量に飲んだ'
FROM emergency_symptoms WHERE symptom_code = 'POISONING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '洗剤を飲んだ', '洗剤を飲んだ'
FROM emergency_symptoms WHERE symptom_code = 'POISONING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '農薬を飲んだ', '農薬を飲んだ'
FROM emergency_symptoms WHERE symptom_code = 'POISONING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '毒物を飲んだ', '毒物を飲んだ'
FROM emergency_symptoms WHERE symptom_code = 'POISONING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '一酸化炭素中毒', '一酸化炭素中毒'
FROM emergency_symptoms WHERE symptom_code = 'POISONING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '練炭の煙を吸った', '練炭の煙を吸った'
FROM emergency_symptoms WHERE symptom_code = 'POISONING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '有毒ガスを吸った', '有毒ガスを吸った'
FROM emergency_symptoms WHERE symptom_code = 'POISONING';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('DROWNING', '溺れた', 5, '事故', '呼吸や心臓が停止する危険があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '溺れた', '溺れた'
FROM emergency_symptoms WHERE symptom_code = 'DROWNING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '水に沈んだ', '水に沈んだ'
FROM emergency_symptoms WHERE symptom_code = 'DROWNING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'おぼれた', 'おぼれた'
FROM emergency_symptoms WHERE symptom_code = 'DROWNING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '浴槽で沈んでいた', '浴槽で沈んでいた'
FROM emergency_symptoms WHERE symptom_code = 'DROWNING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '海で流された', '海で流された'
FROM emergency_symptoms WHERE symptom_code = 'DROWNING';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('HEATSTROKE_SEVERE', '重い熱中症の疑い', 5, '環境', '意識障害を伴う熱中症の可能性があります。', '涼しい場所へ移し、直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '暑い場所で意識がおかしい', '暑い場所で意識がおかしい'
FROM emergency_symptoms WHERE symptom_code = 'HEATSTROKE_SEVERE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '熱中症で倒れた', '熱中症で倒れた'
FROM emergency_symptoms WHERE symptom_code = 'HEATSTROKE_SEVERE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '暑さで意識がない', '暑さで意識がない'
FROM emergency_symptoms WHERE symptom_code = 'HEATSTROKE_SEVERE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '体が熱くて反応が鈍い', '体が熱くて反応が鈍い'
FROM emergency_symptoms WHERE symptom_code = 'HEATSTROKE_SEVERE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '高体温で意識障害', '高体温で意識障害'
FROM emergency_symptoms WHERE symptom_code = 'HEATSTROKE_SEVERE';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SEVERE_ABDOMINAL', '突然または持続する激しい腹痛', 5, '腹部', '緊急疾患の可能性があります。', '直ちに119番への通報を検討してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '突然の激しい腹痛', '突然の激しい腹痛'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_ABDOMINAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '腹が激しく痛い', '腹が激しく痛い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_ABDOMINAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'お腹の激痛', 'お腹の激痛'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_ABDOMINAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '腹痛がずっと続く', '腹痛がずっと続く'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_ABDOMINAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '動けないほど腹が痛い', '動けないほど腹が痛い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_ABDOMINAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '腹が硬い', '腹が硬い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_ABDOMINAL';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('VOMIT_BLOOD', '血を吐いた', 5, '消化器', '消化管出血などの可能性があります。', '直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '血を吐いた', '血を吐いた'
FROM emergency_symptoms WHERE symptom_code = 'VOMIT_BLOOD';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '吐血', '吐血'
FROM emergency_symptoms WHERE symptom_code = 'VOMIT_BLOOD';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'コーヒー色のものを吐いた', 'コーヒー色のものを吐いた'
FROM emergency_symptoms WHERE symptom_code = 'VOMIT_BLOOD';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '血の混じった嘔吐', '血の混じった嘔吐'
FROM emergency_symptoms WHERE symptom_code = 'VOMIT_BLOOD';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('BLOODY_BLACK_STOOL', '血便または黒い便', 5, '消化器', '消化管出血などの可能性があります。', '多量、ふらつき、意識低下を伴う場合は直ちに119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '血便', '血便'
FROM emergency_symptoms WHERE symptom_code = 'BLOODY_BLACK_STOOL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '便に血が混じる', '便に血が混じる'
FROM emergency_symptoms WHERE symptom_code = 'BLOODY_BLACK_STOOL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '真っ黒い便', '真っ黒い便'
FROM emergency_symptoms WHERE symptom_code = 'BLOODY_BLACK_STOOL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'タール便', 'タール便'
FROM emergency_symptoms WHERE symptom_code = 'BLOODY_BLACK_STOOL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '黒い便が出た', '黒い便が出た'
FROM emergency_symptoms WHERE symptom_code = 'BLOODY_BLACK_STOOL';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SEVERE_DIZZINESS', '急に立てないほどのふらつき', 5, '脳神経', '脳卒中などの可能性があります。', '直ちに119番への通報を検討してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急に立てない', '急に立てない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DIZZINESS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '支えなしで立てない', '支えなしで立てない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DIZZINESS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '突然ふらつく', '突然ふらつく'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DIZZINESS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'まっすぐ歩けない', 'まっすぐ歩けない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DIZZINESS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急に歩けない', '急に歩けない'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_DIZZINESS';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('FAINTING', '失神した', 4, '意識', '一時的な意識障害です。原因によっては緊急性があります。', '意識が戻らない、胸痛、呼吸困難、けがを伴う場合は119番へ通報してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '失神', '失神'
FROM emergency_symptoms WHERE symptom_code = 'FAINTING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '気を失った', '気を失った'
FROM emergency_symptoms WHERE symptom_code = 'FAINTING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '気絶した', '気絶した'
FROM emergency_symptoms WHERE symptom_code = 'FAINTING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '倒れて一時反応がなかった', '倒れて一時反応がなかった'
FROM emergency_symptoms WHERE symptom_code = 'FAINTING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '目の前が暗くなって倒れた', '目の前が暗くなって倒れた'
FROM emergency_symptoms WHERE symptom_code = 'FAINTING';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('MODERATE_DYSPNEA', '息苦しい', 4, '呼吸', '呼吸器や心臓の異常の可能性があります。', '急に悪化した、会話困難、顔色不良があれば119番へ。迷う場合は救急相談へ。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息苦しい', '息苦しい'
FROM emergency_symptoms WHERE symptom_code = 'MODERATE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息切れがひどい', '息切れがひどい'
FROM emergency_symptoms WHERE symptom_code = 'MODERATE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '呼吸が苦しい', '呼吸が苦しい'
FROM emergency_symptoms WHERE symptom_code = 'MODERATE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '息がしづらい', '息がしづらい'
FROM emergency_symptoms WHERE symptom_code = 'MODERATE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ぜいぜいする', 'ぜいぜいする'
FROM emergency_symptoms WHERE symptom_code = 'MODERATE_DYSPNEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ヒューヒューする', 'ヒューヒューする'
FROM emergency_symptoms WHERE symptom_code = 'MODERATE_DYSPNEA';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('PALPITATION_SEVERE', '強い動悸', 4, '循環器', '不整脈などの可能性があります。', '胸痛、失神、呼吸困難を伴う場合は119番へ。続く場合は早めに受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '動悸が激しい', '動悸が激しい'
FROM emergency_symptoms WHERE symptom_code = 'PALPITATION_SEVERE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '心臓がバクバク', '心臓がバクバク'
FROM emergency_symptoms WHERE symptom_code = 'PALPITATION_SEVERE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '脈が速い', '脈が速い'
FROM emergency_symptoms WHERE symptom_code = 'PALPITATION_SEVERE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '脈が飛ぶ', '脈が飛ぶ'
FROM emergency_symptoms WHERE symptom_code = 'PALPITATION_SEVERE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '心拍がおかしい', '心拍がおかしい'
FROM emergency_symptoms WHERE symptom_code = 'PALPITATION_SEVERE';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('HIGH_FEVER_SUDDEN', '突然の高熱', 4, '発熱', '重い感染症などの可能性があります。', '意識障害、呼吸困難、けいれんなどを伴う場合は119番へ。そうでなければ早めに相談してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '突然の高熱', '突然の高熱'
FROM emergency_symptoms WHERE symptom_code = 'HIGH_FEVER_SUDDEN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '急な高熱', '急な高熱'
FROM emergency_symptoms WHERE symptom_code = 'HIGH_FEVER_SUDDEN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '40度の熱', '40度の熱'
FROM emergency_symptoms WHERE symptom_code = 'HIGH_FEVER_SUDDEN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '高熱でぐったり', '高熱でぐったり'
FROM emergency_symptoms WHERE symptom_code = 'HIGH_FEVER_SUDDEN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '熱が急に上がった', '熱が急に上がった'
FROM emergency_symptoms WHERE symptom_code = 'HIGH_FEVER_SUDDEN';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('PERSISTENT_VOMITING', '繰り返す嘔吐', 4, '消化器', '脱水や重い病気の可能性があります。', '水分が取れない、意識がおかしい、強い痛みを伴う場合は早めに受診・相談してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '何度も吐く', '何度も吐く'
FROM emergency_symptoms WHERE symptom_code = 'PERSISTENT_VOMITING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '吐き続ける', '吐き続ける'
FROM emergency_symptoms WHERE symptom_code = 'PERSISTENT_VOMITING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '嘔吐が止まらない', '嘔吐が止まらない'
FROM emergency_symptoms WHERE symptom_code = 'PERSISTENT_VOMITING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '水を飲んでも吐く', '水を飲んでも吐く'
FROM emergency_symptoms WHERE symptom_code = 'PERSISTENT_VOMITING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '繰り返し嘔吐', '繰り返し嘔吐'
FROM emergency_symptoms WHERE symptom_code = 'PERSISTENT_VOMITING';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('DEHYDRATION', '脱水の疑い', 4, '全身', '強い脱水の可能性があります。', '意識低下、尿がほとんど出ない、飲めない場合は早めに医療機関へ相談してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '水分が取れない', '水分が取れない'
FROM emergency_symptoms WHERE symptom_code = 'DEHYDRATION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '尿が出ない', '尿が出ない'
FROM emergency_symptoms WHERE symptom_code = 'DEHYDRATION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'おしっこが出ない', 'おしっこが出ない'
FROM emergency_symptoms WHERE symptom_code = 'DEHYDRATION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '口がカラカラ', '口がカラカラ'
FROM emergency_symptoms WHERE symptom_code = 'DEHYDRATION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '脱水', '脱水'
FROM emergency_symptoms WHERE symptom_code = 'DEHYDRATION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ぐったりして飲めない', 'ぐったりして飲めない'
FROM emergency_symptoms WHERE symptom_code = 'DEHYDRATION';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SEVERE_BACK_PAIN', '強い背中や腰の痛み', 4, '体幹', '内臓や血管の病気が隠れている可能性があります。', '突然の激痛、胸痛、麻痺を伴う場合は119番へ。そうでなければ早めに受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '背中が激しく痛い', '背中が激しく痛い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BACK_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '腰が激しく痛い', '腰が激しく痛い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BACK_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '突然腰が痛い', '突然腰が痛い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BACK_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '動けないほど背中が痛い', '動けないほど背中が痛い'
FROM emergency_symptoms WHERE symptom_code = 'SEVERE_BACK_PAIN';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('EYE_CHEMICAL', '目に薬品が入った', 4, '眼', '眼の損傷につながる可能性があります。', '直ちに流水で十分洗い、製品情報を持って医療機関や相談窓口へ連絡してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '目に薬品', '目に薬品'
FROM emergency_symptoms WHERE symptom_code = 'EYE_CHEMICAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '目に洗剤', '目に洗剤'
FROM emergency_symptoms WHERE symptom_code = 'EYE_CHEMICAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '目に酸が入った', '目に酸が入った'
FROM emergency_symptoms WHERE symptom_code = 'EYE_CHEMICAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '目にアルカリが入った', '目にアルカリが入った'
FROM emergency_symptoms WHERE symptom_code = 'EYE_CHEMICAL';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '化学物質が目に入った', '化学物質が目に入った'
FROM emergency_symptoms WHERE symptom_code = 'EYE_CHEMICAL';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('FRACTURE_SUSPECT', '骨折の疑い', 3, '外傷', '骨折や脱臼の可能性があります。', '無理に動かさず固定し、変形・しびれ・血流不良があれば早めに受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '骨折したかも', '骨折したかも'
FROM emergency_symptoms WHERE symptom_code = 'FRACTURE_SUSPECT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '骨が折れた', '骨が折れた'
FROM emergency_symptoms WHERE symptom_code = 'FRACTURE_SUSPECT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '手足が変形', '手足が変形'
FROM emergency_symptoms WHERE symptom_code = 'FRACTURE_SUSPECT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '関節が変形', '関節が変形'
FROM emergency_symptoms WHERE symptom_code = 'FRACTURE_SUSPECT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '動かすと激痛', '動かすと激痛'
FROM emergency_symptoms WHERE symptom_code = 'FRACTURE_SUSPECT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '腫れて動かせない', '腫れて動かせない'
FROM emergency_symptoms WHERE symptom_code = 'FRACTURE_SUSPECT';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('HEAD_INJURY', '頭を打った', 3, '外傷', '時間がたって症状が出ることがあります。', '意識障害、繰り返す嘔吐、強い頭痛、けいれんがあれば119番へ。症状があれば受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭を打った', '頭を打った'
FROM emergency_symptoms WHERE symptom_code = 'HEAD_INJURY';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭をぶつけた', '頭をぶつけた'
FROM emergency_symptoms WHERE symptom_code = 'HEAD_INJURY';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '転んで頭を打った', '転んで頭を打った'
FROM emergency_symptoms WHERE symptom_code = 'HEAD_INJURY';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'たんこぶ', 'たんこぶ'
FROM emergency_symptoms WHERE symptom_code = 'HEAD_INJURY';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭部打撲', '頭部打撲'
FROM emergency_symptoms WHERE symptom_code = 'HEAD_INJURY';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('ABDOMINAL_PAIN', '腹痛', 3, '腹部', '原因はさまざまです。', '強くなる、長く続く、発熱・嘔吐・血便を伴う場合は早めに受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '腹痛', '腹痛'
FROM emergency_symptoms WHERE symptom_code = 'ABDOMINAL_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'お腹が痛い', 'お腹が痛い'
FROM emergency_symptoms WHERE symptom_code = 'ABDOMINAL_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '腹が痛い', '腹が痛い'
FROM emergency_symptoms WHERE symptom_code = 'ABDOMINAL_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '胃が痛い', '胃が痛い'
FROM emergency_symptoms WHERE symptom_code = 'ABDOMINAL_PAIN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'みぞおちが痛い', 'みぞおちが痛い'
FROM emergency_symptoms WHERE symptom_code = 'ABDOMINAL_PAIN';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('FEVER', '発熱', 3, '発熱', '感染症などが考えられます。', '水分を取り、症状が強い・長引く・呼吸が苦しい場合は医療機関へ相談してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '発熱', '発熱'
FROM emergency_symptoms WHERE symptom_code = 'FEVER';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '熱がある', '熱がある'
FROM emergency_symptoms WHERE symptom_code = 'FEVER';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '高熱', '高熱'
FROM emergency_symptoms WHERE symptom_code = 'FEVER';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '微熱', '微熱'
FROM emergency_symptoms WHERE symptom_code = 'FEVER';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '体温が高い', '体温が高い'
FROM emergency_symptoms WHERE symptom_code = 'FEVER';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '38度の熱', '38度の熱'
FROM emergency_symptoms WHERE symptom_code = 'FEVER';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('VOMITING', '嘔吐', 3, '消化器', '脱水に注意が必要です。', '少量ずつ水分を取り、繰り返す、水分が取れない、血が混じる場合は受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '嘔吐', '嘔吐'
FROM emergency_symptoms WHERE symptom_code = 'VOMITING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '吐いた', '吐いた'
FROM emergency_symptoms WHERE symptom_code = 'VOMITING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ゲロを吐いた', 'ゲロを吐いた'
FROM emergency_symptoms WHERE symptom_code = 'VOMITING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '戻した', '戻した'
FROM emergency_symptoms WHERE symptom_code = 'VOMITING';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '気持ち悪くて吐いた', '気持ち悪くて吐いた'
FROM emergency_symptoms WHERE symptom_code = 'VOMITING';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('DIARRHEA', '下痢', 2, '消化器', '感染症や食事などさまざまな原因があります。', '水分と電解質を補い、血便、高熱、強い腹痛、脱水があれば受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '下痢', '下痢'
FROM emergency_symptoms WHERE symptom_code = 'DIARRHEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '水下痢', '水下痢'
FROM emergency_symptoms WHERE symptom_code = 'DIARRHEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'お腹を下した', 'お腹を下した'
FROM emergency_symptoms WHERE symptom_code = 'DIARRHEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '便がゆるい', '便がゆるい'
FROM emergency_symptoms WHERE symptom_code = 'DIARRHEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '何度も下痢', '何度も下痢'
FROM emergency_symptoms WHERE symptom_code = 'DIARRHEA';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('NAUSEA', '吐き気', 2, '消化器', 'さまざまな原因があります。', '安静と水分補給を行い、強い痛み、繰り返す嘔吐、意識異常があれば受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '吐き気', '吐き気'
FROM emergency_symptoms WHERE symptom_code = 'NAUSEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '気持ち悪い', '気持ち悪い'
FROM emergency_symptoms WHERE symptom_code = 'NAUSEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'むかむかする', 'むかむかする'
FROM emergency_symptoms WHERE symptom_code = 'NAUSEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '吐きそう', '吐きそう'
FROM emergency_symptoms WHERE symptom_code = 'NAUSEA';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '悪心', '悪心'
FROM emergency_symptoms WHERE symptom_code = 'NAUSEA';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('HEADACHE', '頭痛', 2, '頭部', '疲労、発熱などさまざまな原因があります。', '突然の激痛、麻痺、言語障害、発熱と首の硬さがあれば緊急対応してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭痛', '頭痛'
FROM emergency_symptoms WHERE symptom_code = 'HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭が痛い', '頭が痛い'
FROM emergency_symptoms WHERE symptom_code = 'HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '頭がズキズキ', '頭がズキズキ'
FROM emergency_symptoms WHERE symptom_code = 'HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '片頭痛', '片頭痛'
FROM emergency_symptoms WHERE symptom_code = 'HEADACHE';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '偏頭痛', '偏頭痛'
FROM emergency_symptoms WHERE symptom_code = 'HEADACHE';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('DIZZINESS', 'めまい', 2, '脳神経', '耳や血圧などさまざまな原因があります。', '突然立てない、麻痺、ろれつ障害、激しい頭痛を伴う場合は119番へ。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'めまい', 'めまい'
FROM emergency_symptoms WHERE symptom_code = 'DIZZINESS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '目が回る', '目が回る'
FROM emergency_symptoms WHERE symptom_code = 'DIZZINESS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'ふらふらする', 'ふらふらする'
FROM emergency_symptoms WHERE symptom_code = 'DIZZINESS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'くらくらする', 'くらくらする'
FROM emergency_symptoms WHERE symptom_code = 'DIZZINESS';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '天井が回る', '天井が回る'
FROM emergency_symptoms WHERE symptom_code = 'DIZZINESS';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('SORE_THROAT', 'のどの痛み', 2, '呼吸器', '感染症などが考えられます。', '水分が飲めない、呼吸が苦しい、急に腫れた場合は早めに相談してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '喉が痛い', '喉が痛い'
FROM emergency_symptoms WHERE symptom_code = 'SORE_THROAT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'のどが痛い', 'のどが痛い'
FROM emergency_symptoms WHERE symptom_code = 'SORE_THROAT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '飲み込むと痛い', '飲み込むと痛い'
FROM emergency_symptoms WHERE symptom_code = 'SORE_THROAT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '咽頭痛', '咽頭痛'
FROM emergency_symptoms WHERE symptom_code = 'SORE_THROAT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '喉が腫れた', '喉が腫れた'
FROM emergency_symptoms WHERE symptom_code = 'SORE_THROAT';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('COUGH', 'せき', 2, '呼吸器', '感染症や気道の刺激などが考えられます。', '呼吸困難、胸痛、血を吐くようなせき、高熱があれば受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '咳', '咳'
FROM emergency_symptoms WHERE symptom_code = 'COUGH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'せき', 'せき'
FROM emergency_symptoms WHERE symptom_code = 'COUGH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '咳が止まらない', '咳が止まらない'
FROM emergency_symptoms WHERE symptom_code = 'COUGH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '咳き込む', '咳き込む'
FROM emergency_symptoms WHERE symptom_code = 'COUGH';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'コンコンする', 'コンコンする'
FROM emergency_symptoms WHERE symptom_code = 'COUGH';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('MINOR_CUT', '軽い切り傷', 1, '外傷', '軽度の外傷と思われます。', '流水で洗い、清潔な布やガーゼで圧迫してください。深い・開いている・止血できない場合は受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '切り傷', '切り傷'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_CUT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '指を切った', '指を切った'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_CUT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '包丁で切った', '包丁で切った'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_CUT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '紙で切った', '紙で切った'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_CUT';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '小さな傷', '小さな傷'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_CUT';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('ABRASION', '擦り傷', 1, '外傷', '軽度の外傷と思われます。', '流水で汚れを洗い流し、清潔に保護してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '擦り傷', '擦り傷'
FROM emergency_symptoms WHERE symptom_code = 'ABRASION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'すり傷', 'すり傷'
FROM emergency_symptoms WHERE symptom_code = 'ABRASION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '転んですりむいた', '転んですりむいた'
FROM emergency_symptoms WHERE symptom_code = 'ABRASION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '膝をすりむいた', '膝をすりむいた'
FROM emergency_symptoms WHERE symptom_code = 'ABRASION';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '皮がむけた', '皮がむけた'
FROM emergency_symptoms WHERE symptom_code = 'ABRASION';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('MINOR_BURN', '軽いやけど', 1, 'やけど', '軽いやけどの可能性があります。', 'すぐに流水で冷やしてください。広範囲、顔・関節、深いやけどは受診してください。');

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '軽いやけど', '軽いやけど'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '熱い物に触った', '熱い物に触った'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '指をやけど', '指をやけど'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, 'お湯がかかった', 'お湯がかかった'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_BURN';

INSERT INTO symptom_aliases (symptom_id, alias, normalized_alias)
SELECT id, '軽い熱傷', '軽い熱傷'
FROM emergency_symptoms WHERE symptom_code = 'MINOR_BURN';

INSERT INTO emergency_symptoms (symptom_code, canonical_name, emergency_level, category, message, action)
VALUES ('NO_MATCH', '判定不能', 0, 'その他', '登録語彙だけでは判断できません。', '症状が強い、急に悪化した、判断に迷う場合は119番または地域の救急相談窓口へ相談してください。');


-- 入力文章から部分一致した症状を緊急度順に返す関数
CREATE OR REPLACE FUNCTION search_emergency_symptoms(input_text TEXT)
RETURNS TABLE (
    symptom_code VARCHAR,
    canonical_name VARCHAR,
    matched_alias VARCHAR,
    emergency_level SMALLINT,
    category VARCHAR,
    message TEXT,
    action TEXT
)
LANGUAGE SQL
AS $$
    WITH normalized_input AS (
        SELECT lower(
            replace(
                replace(COALESCE(input_text, ''), ' ', ''),
                '　', ''
            )
        ) AS value
    ),
    matches AS (
        SELECT
            s.symptom_code,
            s.canonical_name,
            a.alias AS matched_alias,
            s.emergency_level,
            s.category,
            s.message,
            s.action,
            row_number() OVER (
                PARTITION BY s.id
                ORDER BY length(a.normalized_alias) DESC
            ) AS alias_rank
        FROM emergency_symptoms s
        JOIN symptom_aliases a ON a.symptom_id = s.id
        CROSS JOIN normalized_input n
        WHERE s.enabled = TRUE
          AND n.value LIKE '%' || a.normalized_alias || '%'
    )
    SELECT
        symptom_code,
        canonical_name,
        matched_alias,
        emergency_level,
        category,
        message,
        action
    FROM matches
    WHERE alias_rank = 1
    ORDER BY emergency_level DESC, canonical_name;
$$;

COMMIT;

-- 使用例
-- SELECT * FROM search_emergency_symptoms(
--     '急にろれつが回らんし、片腕が上がらない'
-- );
--
-- 登録件数確認
-- SELECT COUNT(*) AS symptom_count FROM emergency_symptoms;
-- SELECT COUNT(*) AS alias_count FROM symptom_aliases;
