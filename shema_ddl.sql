CREATE TABLE Товары (
  ID SERIAL PRIMARY KEY,
  Наименование VARCHAR(255) NOT NULL,
  Цена NUMERIC(10, 2) NOT NULL CHECK (Цена > 0),
  Описание TEXT,
  Наличие_на_складе INTEGER CHECK (Наличие_на_складе >= 0),
  Производитель VARCHAR(255),
  Категория_ID INTEGER
);

CREATE TABLE Категории (
  ID SERIAL PRIMARY KEY,
  Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Заказы (
  ID SERIAL PRIMARY KEY,
  Дата_оформления DATE NOT NULL,
  Статус VARCHAR(50) NOT NULL,
  Сумма NUMERIC(10, 2) NOT NULL,
  Клиент_ID INTEGER,
  Доставка_ID INTEGER,
ID_товара INTEGER
);

CREATE TABLE Клиенты (
  ID SERIAL PRIMARY KEY,
  Имя VARCHAR(50) NOT NULL,
  Фамилия VARCHAR(50) NOT NULL,
  Адрес TEXT,
  Контактная_информация TEXT
);

CREATE TABLE Доставка (
  ID SERIAL PRIMARY KEY,
  Дата_доставки DATE NOT NULL,
  Способ_доставки VARCHAR(100) NOT NULL,
  Стоимость_доставки NUMERIC(10, 2) NOT NULL CHECK (Стоимость_доставки > 0), 
  Адрес_доставки TEXT,
  Статус_доставки VARCHAR(50) NOT NULL
);
CREATE TABLE Отзывы (
  ID SERIAL PRIMARY KEY,
  Оценка INTEGER NOT NULL,
  Комментарий TEXT,
  Дата DATE NOT NULL,
  Товар_ID INTEGER,
  Клиент_ID INTEGER
);
CREATE TABLE Товары_в_заказе (
  Заказ_ID INTEGER,
  Товар_ID INTEGER,
  Количество INTEGER,
  FOREIGN KEY (Заказ_ID) REFERENCES Заказы(ID),
  FOREIGN KEY (Товар_ID) REFERENCES Товары(ID)
);
ALTER TABLE Товары ADD FOREIGN KEY (Категория_ID) REFERENCES Категории(ID);
ALTER TABLE Заказы ADD FOREIGN KEY (Клиент_ID) REFERENCES Клиенты(ID);
ALTER TABLE Заказы ADD  FOREIGN KEY (Доставка_ID) REFERENCES Доставка(ID);
ALTER TABLE Отзывы ADD FOREIGN KEY (Товар_ID) REFERENCES Товары(ID);
ALTER TABLE Отзывы ADD FOREIGN KEY (Клиент_ID) REFERENCES Клиенты(ID);
