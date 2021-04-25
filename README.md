# О проекте

Описание бинарных форматов игр  **Дальнобойщики 1**, **Дальнобойщики 2** (версия 8) и **Дальнобойщики 3**. Для каждого формата доступен (в процессе) шаблон шестнадцатиричного редактора **010 Editor**. 

| b3D | MSK | PLM | RMP | TXR | RES | TECH | RAW | WAY | WMD |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | 
| >50% | 100% | 100% | 100% | 100% | 100% | >85% | 100% | 95% | 5% |

####  Дополнительные ссылки
[Группа ВК](https://vk.com/rnr_mods)

## Форматы файлов

Описание форматов файлов сделано в виде шаблонов для программы **010Editor**. Шаблоны в формате .bt хранят структуры в стиле языка C, если открыть файл в 010Editor и применить шаблон, то программа отобразит дерево структур файла, в котором удобно изменять значения хранимых переменных и совершать другие манипуляции.

#### Дальнобойщики 1 (1998)

| № | Формат | Прогресс  | Шаблон (010 Editor) | Описание | О формате |
| :-- | :------- | :-- | :-- | :-- | :-- |
|  **1**  |  .b3D**  |   [b3D](https://github.com/AlexKimov/HT2-RnR-tools/issues/2)  | [b3D.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/B3D.bt) | [Wiki](https://github.com/AlexKimov/HT2-RnR-tools/wiki/b3D-File-Format-Rus) | 3D объекты и объекты игровой логики (модели коллизий, порталы, объекты освещения и т.п.) |
|  **2**  | .MSK | [MSK](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/1) |  [MSK.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/MSK.bt) | [WIKI](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/MSK-File-Format-Rus)  | 8 битные файлы масок, хранятся в архиве .RMP | 
|  **3**  | .PLM | [PLM](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/7) |  [PLM.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/PLM.bt) |  [WIKI](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/PLM-File-Format-Rus) | Палитра и что-то еще, хранятся в архиве .RMP | 
|  **4**  | .RMP* | [RMP](https://github.com/AlexKimov/HT2-RnR-tools/issues/3) |  [RES.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RES.bt) | [WIKI](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/RES-RMP-File-Format-RUS)  | Архив ресурсов (звуки, текстуры) | 
| **5**  | .TXR | [TXR](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/6) |  [TXR.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TXR.bt) | [WIKI](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/TXR-File-Format-RUS)  | Текстура | 

    * Формат аналогичен формату RES из второй части игры (Дальнобойщики 2)
    ** Формат аналогичен формату b3D из второй части игры (Дальнобойщики 2), ну или наоборот

#### Дальнобойщики 2 (версия 8)

| № | Формат | Прогресс  | Шаблон (010 Editor) | Описание | О формате |
| :-- | :------- | :-- | :-- | :-- | :-- |
|  **1**  |  .b3D  |   [b3D](https://github.com/AlexKimov/HT2-RnR-tools/issues/2)  | [b3D.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/B3D.bt) | [Wiki](https://github.com/AlexKimov/HT2-RnR-tools/wiki/b3D-File-Format-Rus) | 3D объекты и объекты игровой логики (модели коллизий, порталы, объекты освещения и т.п.) |
|  **2**  | .MSK | [MSK](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/1) |  [MSK.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/MSK.bt) | [Вики](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/MSK-File-Format-Rus)  | 8/16 битные файлы масок, хранятся в архиве .RES | 
|  **3**  | .PLM | [PLM](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/7) |  [PLM.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/PLM.bt) |  [WIKI](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/PLM-File-Format-Rus) | Палитра, хранится в архиве .RES | 
|  **4**  | .RAW | [RAW](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/8) |  | [WIKI](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/RAW-File-Format-RUS)  |  Карты высот | 
|  **5**  | .RES | [RES](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/3) |  [RES.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RES.bt) | [WIKI](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/RES-RMP-File-Format-RUS)  | Архив ресурсов (звуки, текстуры) | 
|  **6**  | .TECH | [TECH](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/9) |  [TECH.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TECH.bt) |   | Параметры транспортных средств | 
|  **7**  | .TXR | [TXR](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/6)  |  [TXR.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TXR.bt) |   [WIKI](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/wiki/TXR-File-Format-RUS) | Текстура | 
|  **8**  | .WAY | [WAY](https://github.com/AlexKimov/HT2-RnR-tools/issues/4)  | [WAY.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/WAY.bt) |  | Пути для транспорта под управлением ИИ | 

#### Дальнобойщики 3 (2009)
| № | Формат | Прогресс  | Шаблон |  Описание   |
| :-- | :------- | :-- | :-- | :-- |
|  **1**  |  .WMD  |     | [WMD.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/WDB.bt) | 3D объекты и объекты игровой логики (модели коллизий, порталы, объекты освещения и т.п.) |

## Спасибо
Юрий Гладышенко

* * * 
# About
Hard Truck 1 (1998), Hard Truck 2 King of the Road 1.3 and RignRoll (2010) games file formats. Current progress status [see Issues](https://github.com/AlexKimov/HT2-RnR-tools/issues). 

Formats description will be [there (Wiki)](https://github.com/AlexKimov/HT2-RnR-tools/wiki).

#### Roadmap

###### Hard Truck 1/2
1. **b3D** format, evereything else is ready to use (almost).

2. Formats documentation in english.

3. Conversion to other formats.

#### Hard Truck 1 (1998)

| № | Format/Ext | Progress   | Template (010 Editor) |  Description   |
| :-- | :------- | :-- | :-- | :-- | 
|  **1**  |  .b3D**  |   [b3D](https://github.com/AlexKimov/HT2-RnR-tools/issues/2)  | [b3D.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/B3D.bt) | Game logic and 3D objects |
|  **2**  | .RMP* | [RMP](https://github.com/AlexKimov/HT2-RnR-tools/issues/3) |  [RES.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RES.bt) | Resource archive: sounds, textures | 
|  **3**  | .PLM | [PLM](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/7) | [PLM.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/PLM.bt) |   Palette | 
|  **4**  | .MSK | [MSK](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/1)  |  [MSK.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/MSK.bt) |    Texture Masks, 8-bit with palette | 
|  **5**  | .TXR | [TXR](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/6) |  [TXR.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TXR.bt) |    Texture file |

    *  almost the same as RES format from Hard Truck 2
    **  b3D format from Hard Truck 2 has the same structure, but there are some differences

#### Hard Truck 2 King of the Road (2002)
| № | Format/Ext | Progress   | Template (010 Editor) |  Description   |
| :-- | :------- | :-- | :-- | :-- |
|  **1**  | .b3D |   [b3D](https://github.com/AlexKimov/HT2-RnR-tools/issues/2)  | [b3D.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/B3D.bt) | Game logic and 3D objects |
|  **2**  | .MSK | [MSK](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/1) |  [MSK.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/MSK.bt) |    Mask files stored in .RES | 
|  **3**  | .PLM | [PLM](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/7) |  [PLM.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/PLM.bt) |    Palette file in .RES | 
|  **4**  | .RAW | [RAW](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/8) |   [RAW.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RAW.bt) |  Heightmaps | 
|  **5**  | .RES | [RES](https://github.com/AlexKimov/HT2-RnR-tools/issues/3)   | [RES.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/RES.bt) | Resource archive: sounds, textures | 
|  **6**  | .TECH | [TECH](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/9)  |  [TECH.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TECH.bt) |   Vehicle params | 
|  **7**  | .TXR | [TXR](https://github.com/AlexKimov/HardTruck-RignRoll-file-formats/issues/6) |  [TXR.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/TXR.bt) |   Texture file |
|  **8**  | .WAY | [WAY](https://github.com/AlexKimov/HT2-RnR-tools/issues/4)   | [WAY.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/WAY.bt) | AI waypoints | 

#### RignRoll (2009)
| № | Format/Ext | Progress   | Template (010 Editor) |  Description   |
| :-- | :------- | :-- | :-- | :-- |
|  **1**  |  .WMD  |   WIP  | [WMD.bt](https://github.com/AlexKimov/HT2-modding-tools/blob/master/formats/templates/WDB.bt) | Game logic and 3D objects |
