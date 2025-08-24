
# **2. Требования**

Библиотека тестировалась в **Ubuntu 24.04**.

## **Компилятор C++23**

## **Pangolin**

Используется [Pangolin](https://github.com/stevenlovegrove/Pangolin) для визуализации и пользовательского интерфейса.
Инструкции по установке: https://github.com/stevenlovegrove/Pangolin.

## **OpenCV**

Используется [OpenCV](http://opencv.org) для обработки изображений и признаков.
Инструкции по установке: http://opencv.org.
**Требуется OpenCV версии 4.6.0 или новее**.


## **Eigen3**

Требуется для работы g2o (см. ниже).
Инструкции по установке: http://eigen.tuxfamily.org.
**Необходима версия минимум 3.1.0**. Тестировалось с Eigen3 3.4.0.

## **DBoW2 и g2o (включены в папку Thirdparty)**

Используются модифицированные версии библиотек [DBoW2](https://github.com/dorian3d/DBoW2) для распознавания местоположений и [g2o](https://github.com/RainerKuemmerle/g2o) для выполнения нелинейной оптимизации.

Обе библиотеки (BSD) включены в папку _Thirdparty_.

## **Python**

Требуется для вычисления выравнивания траектории с эталоном.

Необходим модуль **Numpy**.

- (win) http://www.python.org/downloads/windows
    
- (deb) sudo apt install libpython2.7-dev
    
- (mac) предустановлен в OSX

# **3. Сборка библиотеки ORB-SLAM3 и примеров**
Клонируйте репозиторий:

```
git clone https://github.com/GENBBB/MSU_SLAM.git MSU_SLAM
```

**Необходимые условия для современной сборки:**

- CMake 3.16 или новее
    
- GCC 11+ или Clang 14+ с поддержкой C++23
    
- Пакеты разработки OpenCV 4.6.0+
    
- Пакеты разработки Eigen3 3.4.0+
    
- Библиотеки Boost (serialization)
    

  

Мы предоставляем скрипт build.sh для сборки библиотек _Thirdparty_ и _ORB-SLAM3_.

Убедитесь, что все необходимые зависимости установлены (см. раздел 2). Выполните:

```
cd MSU_SLAM
chmod +x build.sh
./build.sh
```

В результате будет создана библиотека **libORB_SLAM3.so** в папке _lib_ и исполняемые файлы в папке _Examples_.

Система сборки была модернизирована для использования стандарта C++23 и последних API OpenCV.

---

# **4. Запуск MSU_SLAM с вашей камерой**

  

Каталог Examples содержит несколько демонстрационных программ и файлов калибровки для запуска ORB-SLAM3 во всех конфигурациях сенсоров с камерами Intel Realsense T265 и D435i.

  

Шаги для использования вашей собственной камеры:

1. Откалибруйте камеру, следуя инструкции в Calibration_Tutorial.pdf, и создайте файл калибровки your_camera.yaml.
    
2. Измените один из предоставленных примеров под вашу модель камеры и соберите его.
    
3. Подключите камеру к компьютеру через USB3 или соответствующий интерфейс.
    
4. Запустите ORB-SLAM3. Например, для камеры D435i команда будет:
    

```
./Examples/Stereo-Inertial/stereo_inertial_realsense_D435i Vocabulary/ORBvoc.txt ./Examples/Stereo-Inertial/RealSense_D435i.yaml
```

  

---

# **5. Примеры с EuRoC**

  

[EuRoC dataset](http://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets) был записан с двумя pinhole-камерами и инерциальным датчиком. Мы предоставляем скрипт для запуска последовательностей EuRoC во всех конфигурациях сенсоров.

1. Скачайте последовательность (ASL формат) с сайта EuRoC.
    
2. Откройте скрипт euroc_examples.sh в корневой папке проекта. Измените переменную **pathDatasetEuroc**, указав путь к распакованному датасету.
    
3. Выполните скрипт для обработки всех последовательностей:
    

```
./euroc_examples
```

  

  

### **Оценка**

  

Для EuRoC предоставляется эталонная траектория (ground truth). Для чисто визуальных запусков траектория центрируется в левой камере, поэтому мы предоставляем трансформацию эталона в систему координат левой камеры. Визуально-инерциальные траектории используют эталон напрямую.

  

Для расчёта RMS ATE:

```
./euroc_eval_examples
```

---

# **6. Примеры с TUM-VI**

  

[TUM-VI dataset](https://vision.in.tum.de/data/datasets/visual-inertial-dataset) записан с двумя fisheye-камерами и инерциальным датчиком.

1. Скачайте и распакуйте последовательность TUM-VI.
    
2. Откройте скрипт tum_vi_examples.sh в корневой папке проекта. Измените переменную **pathDatasetTUM_VI**, указав путь к распакованному датасету.
    
3. Выполните скрипт для обработки всех последовательностей:
    

```
./tum_vi_examples
```

  

  

### **Оценка**

  

Эталонная траектория для TUM-VI доступна только в комнате, где начинаются и заканчиваются все последовательности. Поэтому ошибка измеряется по дрейфу в конце траектории.

  

Для расчёта RMS ATE:

```
./tum_vi_eval_examples
```

---

# **7. Примеры с ROS**

  

### **Сборка узлов для: mono, mono-inertial, stereo, stereo-inertial и RGB-D**

  

Тестировалось с ROS Melodic под Ubuntu 18.04.

1. Добавьте путь к _Examples/ROS/ORB_SLAM3_ в переменную окружения ROS_PACKAGE_PATH. Для этого откройте .bashrc:
    

```
gedit ~/.bashrc
```

1. В конец файла добавьте строку (замените PATH на путь к ORB_SLAM3):
    

```
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:PATH/ORB_SLAM3/Examples/ROS
```

1.   
    
2. Выполните скрипт сборки:
    

```
chmod +x build_ros.sh
./build_ros.sh
```

  

---

### **Запуск узлов**

  

**Моно-камера:**

```
rosrun ORB_SLAM3 Mono PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE
```

**Моно + IMU:**

```
rosrun ORB_SLAM3 Mono PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE [EQUALIZATION]	
```

**Стерео:**

```
rosrun ORB_SLAM3 Stereo PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE ONLINE_RECTIFICATION
```

**Стерео + IMU:**

```
rosrun ORB_SLAM3 Stereo_Inertial PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE ONLINE_RECTIFICATION [EQUALIZATION]	
```

**RGB-D:**

```
rosrun ORB_SLAM3 RGBD PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE
```

---

### **Пример запуска с ROS и EuRoC**

  

Скачайте rosbag (например, V1_02_medium.bag) из EuRoC. Откройте три вкладки терминала:

```
roscore
```

```
rosrun ORB_SLAM3 Stereo_Inertial Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml true
```

```
rosbag play --pause V1_02_medium.bag /cam0/image_raw:=/camera/left/image_raw /cam1/image_raw:=/camera/right/image_raw /imu0:=/imu
```

После загрузки словаря ORB-SLAM3 нажмите **пробел** в терминале rosbag, чтобы начать воспроизведение.

  

**Примечание:** для датасета TUM-VI иногда возникают проблемы из-за размера чанков. Решение — пересобрать bag с дефолтным размером чанка, например:

```
rosrun rosbag fastrebag.py dataset-room1_512_16.bag dataset-room1_512_16_small_chunks.bag
```
