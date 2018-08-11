# Описание

Описание бинарных форматов игр  **Дальнобойщики 1**, **Дальнобойщики 2** (версия 8) и **Дальнобойщики 3**. Для каждого формата доступен (в процессе) шаблон шестнадцатиричного редактора **010 Editor**, который описывает структуры формата, а также дополнительные скрипты для работы с форматами. 

Текущий прогресс [Issues](https://github.com/AlexKimov/HT2-RnR-tools/issues). Описание форматов [Вики страница](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki).

### Форматы файлов

#### Дальнобойщики 1 (1998)

| № | Формат | Прогресс  | Шаблон (010 Editor) | Описание | О формате |
| :-- | :------- | :-- | :-- | :-- | :-- |
|  1  |  .b3D**  |   [b3D](https://github.com/AlexKimov/HT2-RnR-tools/issues/2)  | [b3D.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/B3D.bt) | [Wiki](https://github.com/AlexKimov/HT2-RnR-tools/wiki/b3D-File-Format-Rus) | 3D объекты и объекты игровой логики (модели коллизий, порталы, объекты освещения и т.п.) |
|  2  | .MSK |  |  [MSK.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/MSK.bt) | [Вики](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/MSK-File-Format-Rus)  | 8 битные файлы масок, хранятся в архиве .RMP | 
|  3  | .PLM |  |  [PLM.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/PLM.bt) |   | Палитра и что-то еще, хранятся в архиве .RMP | 
|  4  | .RMP* | [RMP](https://github.com/AlexKimov/HT2-RnR-tools/issues/3) |  [RES.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RES.bt) |   | Архив ресурсов (звуки, текстуры) | 
|  5  | .TXR |  |  [TXR.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TXR.bt) |   | Текстура | 

    * Формат аналогичен формату RES из второй части игры (Дальнобойщики 2)
    ** Формат аналогичен формату b3D из второй части игры (Дальнобойщики 2), ну или наоборот

#### Дальнобойщики 2 (версия 8)

| № | Формат | Прогресс  | Шаблон (010 Editor) | Описание | О формате |
| :-- | :------- | :-- | :-- | :-- | :-- |
|  1  |  .b3D  |   [b3D](https://github.com/AlexKimov/HT2-RnR-tools/issues/2)  | [b3D.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/B3D.bt) | [Wiki](https://github.com/AlexKimov/HT2-RnR-tools/wiki/b3D-File-Format-Rus) | 3D объекты и объекты игровой логики (модели коллизий, порталы, объекты освещения и т.п.) |
|  2  | .MSK |  |  [MSK.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/MSK.bt) | [Вики](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/MSK-File-Format-Rus)  | 8 битные файлы масок, хранятся в архиве .RES | 
|  3  | .PLM |  |  [PLM.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/PLM.bt) |   | Палитра, хранится в архиве .RES | 
|  4  | .RES | [RES](https://github.com/AlexKimov/HT2-RnR-tools/issues/3) |  [RES.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RES.bt) |   | Архив ресурсов (звуки, текстуры) | 
|  5  | .TXR |  |  [TXR.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TXR.bt) |   | Текстура | 
|  6  | .WAY | [WAY](https://github.com/AlexKimov/HT2-RnR-tools/issues/4)  | [WAY.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/WAY.bt) |  | Пути для транспорта под управлением ИИ | 

#### Дальнобойщики 3
| № | Формат | Прогресс  | Шаблон |  Описание   |
| :-- | :------- | :-- | :-- | :-- |
|  1  |  .WMD  |     | [WMD.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/WDB.bt) | 3D объекты и объекты игровой логики (модели коллизий, порталы, объекты освещения и т.п.) |

### Скрипты

* [UnpackResource.1sc](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/blob/master/scripts/UnpackResource.1sc) - скрипт 010 Editor для распаковки файлов из игровых ресурсов (**.RES/.RMP**) 
* [mskConversion.1sc](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/blob/master/scripts/mskConversion.1sc) - скрипт 010 Editor для конвертирования файлов масок **.msk** игры **Дальнобойщики 1/2** в формат **.tga** или **.bmp**. 
* [PLMToTGA.1sc](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/blob/master/scripts/PLMToTGA.1sc) - скрипт 010 Editor для конвертирования **.plm** файлов игры Дальнобойщики 1 в формат **.tga**. 
* [TXRtoBMP.1sc](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/blob/master/scripts/TXRtoBMP.1sc) - скрипт 010 Editor для конвертирования **.txr** файлов игры **Дальнобойщики 1/2** в формат **.bmp**. 

## Другие игры

1. [Игры на движке Storm 1: Корсары (2000), Age of Sail 2, Рыцари морей (2001)](https://github.com/AlexKimov/seadogs-file-formats)

2. [Серия Hitman: Hitman Сodename 47, Hitman 2 Silent Assassin](https://github.com/AlexKimov/hitman-file-formats)

3. [Игры Red Storm Ent: Rainbow Six 1/2, Ghost Recon (2001) и др.](https://github.com/AlexKimov/RSE-file-formats)

* * * 
# About
Hard Truck 1 (1998), Hard Truck 2 King of the Road (2002) and RignRoll (2010) games file formats. Current progress status [see Issues](https://github.com/AlexKimov/hitman-file-formats/issues). 

Formats description will be [there (Wiki)](https://github.com/AlexKimov/HT2-RnR-tools/wiki).

#### Hard Truck 1 (1998)

| № | Format/Ext | Progress   | Template (010 Editor) |  Description   |
| :-- | :------- | :-- | :-- | :-- | 
|  1  |  .b3D**  |   [b3D](https://github.com/AlexKimov/HT2-RnR-tools/issues/2)  | [b3D.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/B3D.bt) | Game logic and 3D objects |
|  2  | .RMP* | [RMP](https://github.com/AlexKimov/HT2-RnR-tools/issues/3) |  [RES.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RES.bt) | Resource archive: sounds, textures | 
|  3  | .MSK* |  |  [MSK.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/MSK.bt) |   | Texture Masks, 8-bit with palette | 
|  4  | .TXR |  |  [TXR.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TXR.bt) |   | Texture file |

    *  almost the same as RES format from Hard Truck 2
    **  b3D format from Hard Truck 2 has the same structure, but there are some differences

#### Hard Truck 2 King of the Road (2002)
| № | Format/Ext | Progress   | Template (010 Editor) |  Description   |
| :-- | :------- | :-- | :-- | :-- |
|  1  |  .b3D  |   [b3D](https://github.com/AlexKimov/HT2-RnR-tools/issues/2)  | [b3D.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/B3D.bt) | Game logic and 3D objects |
|  2  | .MSK |  |  [MSK.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/MSK.bt) |   | Mask files stored in .RES | 
|  3  | .PLM |  |  [PLM.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/PLM.bt) |   | Palette file in .RES | 
|  4  | .RES | [RES](https://github.com/AlexKimov/HT2-RnR-tools/issues/3)   | [RES.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RES.bt) | Resource archive: sounds, textures | 
|  5  | .TXR |  |  [TXR.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TXR.bt) |   | Texture file |
|  6  | .WAY | [WAY](https://github.com/AlexKimov/HT2-RnR-tools/issues/4)   | [WAY.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/WAY.bt) | AI waypoints | 

#### RignRoll (2010)
| № | Format/Ext | Progress   | Template (010 Editor) |  Description   |
| :-- | :------- | :-- | :-- | :-- |
|  1  |  .WMD  |   WIP  | [WMD.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/WDB.bt) | Game logic and 3D objects |

### Scripts

* [UnpackResource.1sc](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/blob/master/scripts/UnpackResource.1sc) - unpack files from (**.RES/.RMP**) game archives (010 Editor)
* [mskConversion.1sc](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/blob/master/scripts/mskConversion.1sc) - **.msk** to **.tga** conversion script (010 Editor) 
* [PLMToTGA.1sc](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/blob/master/scripts/PLMToTGA.1sc) - **.plm** to **.tga** conversion script (010 Editor) 
* [TXRToTGA.1sc](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/blob/master/scripts/TXRToTGA.1sc) - **.txr* to **.bmp* conversion script (010 Editor) 

## More formats

1. [Sea dogs (2000), Age of Sail 2 (2001)](https://github.com/AlexKimov/seadogs-file-formats)

2. [Hitman Сodename 47, Hitman 2 Silent Assassin](https://github.com/AlexKimov/hitman-file-formats)

3. [Red Storm Ent games: Rainbow Six 1/2, Ghost Recon (2001) and other](https://github.com/AlexKimov/RSE-file-formats)
