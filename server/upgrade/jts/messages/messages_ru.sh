#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2011, 2015. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************

# ################################################################################
#
# Файл с сообщениями, которые выводятся автоматизированными сценариями обновления.
#
# ################################################################################


# *********************
# * Функция messages  *
# *********************
messages() {

case $1 in 

# *********************************
# * Сообщения начальной проверки  *
# *********************************

INVALID_LAUNCH )
echo ""
echo "Не запускайте сценарий app_upgrade напрямую.  Для обновления JTS или приложения выполните одну из следующих команд:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Для просмотра описания этих команд используйте параметр -help."
;;

INVALID_START_DIR )
echo ""
echo "За исключением выполнения с параметром -help, сценарий $2 должен выполняться из $3"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "Файл '$2' содержит значения параметров для сценария обновления."
echo "Для изменения значений по умолчанию для этих параметров отредактируйте эти файлы или укажите значения параметров как аргументы командной строки в сценариях обновления."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "Значения по умолчанию для параметров обновления приложения и JTS содержатся в следующих файлах.  Для изменения значений по умолчанию для этих параметров отредактируйте эти файлы или укажите значения параметров как аргументы командной строки в сценариях обновления."
echo "- Обновление CCM: $2/params/ccm_params$3.sh"
echo "- Обновление GC:  $2/params/gc_params$3.sh"
echo "- Обновление QM:  $2/params/qm_params$3.sh"
echo "- Обновление RM:  $2/params/rm_params$3.sh"
echo "- Обновление JTS: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Сообщения проверки параметров    *
# ************************************

# Встроенная проверка
# ======================

MISSING_APP_TYPE )
echo ""
echo "Не задан тип JTS или приложения.  Для обновления JTS или приложения выполните одну из следующих команд:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Для просмотра описания этих команд используйте параметр -help."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 не является допустимым типом JTS или приложения.  Для обновления JTS или приложения выполните одну из следующих команд:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Для просмотра описания этих команд используйте параметр -help."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Не задано значение параметра $2."
echo "Для просмотра описания параметров укажите -help."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "Каталог $3, заданный в параметре $2, не существует или недопустим."
echo "Для просмотра описания параметров укажите -help."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "Каталог $3, заданный в параметре $2, не является полным путем."
echo "Для просмотра описания параметров укажите -help."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "Файл $3, указанный в параметре $2, не существует или недопустим."
echo "Для просмотра описания параметров укажите -help."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "Значение $3 недопустимо для параметра $2."
echo "Для просмотра описания параметров укажите -help."
echo ""
;;

INVALID_PARAM )
echo ""
echo "Неизвестный параметр: $2."
echo "Для просмотра описания параметров укажите -help."
echo ""
;;


# Внешняя проверка
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Не задан параметр домашнего каталога: $2."
echo "Для просмотра описания параметров укажите -help."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "Каталог $2 не существует или недопустим."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "Не найдена команда repotools приложения '$2'."
echo ""
echo "Убедитесь в том, что в параметре -oldApplicationHome '$3' задан старый каталог конфигурации сервера, например 'JazzInstallRoot/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "Не найдена команда application repotools '$2'."
echo ""
echo "Убедитесь в том, что в параметре -oldApplicationHome '$3' задан старый каталог конфигурации сервера, например 'JazzInstallRoot/server/conf', а значение параметра jtsContextRoot '$4' задано правильно."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "Не найден файл конфигурации '$2'."
echo ""
echo "Убедитесь в том, что в параметре -oldApplicationHome '$3' задан старый каталог конфигурации сервера, например 'JazzInstallRoot/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "Не найден файл конфигурации '$2'."
echo ""
echo "Убедитесь в том, что в параметре -oldApplicationHome '$3' задан старый каталог конфигурации сервера, например 'JazzInstallRoot/server/conf', а значение параметра jtsContextRoot '$4' задано правильно."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "Не найдена команда application repotools '$2'."
echo ""
echo "Убедитесь в том, что в параметре -newApplicationHome '$3' задан новый каталог конфигурации сервера приложений, например 'JazzInstallRoot/server/conf', а значение параметра applicationContextRoot '$4' задано правильно."
echo "Если выполняется обновление предыдущего выпуска, то выберите правильные корневые контексты.  Например, при использовании Installation Manager необходимо выбрать параметр корневого контекста $5 на панели "Параметры корневого контекста".  Если случайно был выбран другой параметр, то необходимо заново установить продукт с параметром корневого контекста $5."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "Не найден файл конфигурации '$2'."
echo ""
echo "Убедитесь в том, что в параметре -newApplicationHome '$3' задан новый каталог конфигурации сервера JTS, например 'JazzInstallRoot/server/conf', а значение параметра applicationContextRoot '$4' задано правильно."
echo "Если выполняется обновление предыдущего выпуска, то выберите правильные корневые контексты.  Например, при использовании Installation Manager необходимо выбрать параметр корневого контекста $5 на панели "Параметры корневого контекста".  Если случайно был выбран другой параметр, то необходимо заново установить продукт с параметром корневого контекста $5."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "Не найдена команда JTS repotools '$2'."
echo ""
echo "Убедитесь в том, что в параметре -oldJTSHome '$3' задан старый каталог конфигурации сервера JTS, например 'JazzInstallRoot/server/conf', а значение параметра jtsContextRoot '$4' задано правильно."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "Не найден файл конфигурации '$2'."
echo ""
echo "Убедитесь в том, что в параметре -oldJTSHome '$3' задан старый каталог конфигурации сервера JTS, например 'JazzInstallRoot/server/conf', а значение параметра jtsContextRoot '$4' задано правильно."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "Не найдена команда JTS repotools '$2'."
echo ""
echo "Убедитесь в том, что в параметре -newJTSHome '$3' задан новый каталог конфигурации сервера JTS, например 'JazzInstallRoot/server/conf', а значение параметра jtsContextRoot '$4' задано правильно."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "Не найден файл конфигурации '$2'."
echo ""
echo "Убедитесь в том, что в параметре -newJTSHome '$3' задан новый каталог конфигурации сервера JTS, например 'JazzInstallRoot/server/conf', а значение параметра jtsContextRoot '$4' задано правильно."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "Для обновления $2 необходим файл tar, содержащий данные 2.x."
echo "Для просмотра описания параметров укажите -help."
echo ""
;;


# ***********************
# * Сообщ. о выполнении *
# ***********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===   Обновление JTS  ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===   Обновление CCM  ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    Обновление GC ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===   Обновление QM  ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===   Обновление RM  ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Проверка прежней версии приложения RM..."
;;

RM_DISPLAY_OLD_VERSION )
echo "Прежняя версия приложения RM: '$2'"
;;

# **************************
# * Переключ. первого шага *
# **************************

INITIAL_STEP_FAILED )
echo ""
echo "Во время последнего выполнения произошла ошибка на первом шаге..."
;;

LAST_STEP_FAILED )
echo ""
echo "Во время последнего выполнения произошла ошибка на шаге $2..."
echo "Перезапустить операцию обновления с текущего или предыдущего шага?"
;;

ALREADY_RUN )
echo ""
echo "Операция обновления была успешно завершена..."
echo "Запустить новую операцию обновления с определенного шага?"
;;

LAST_STEP_PASSED )
echo ""
echo "Последняя операция была успешно остановлена на шаге $2..."
echo "Перезапустить операцию обновления с текущего ($3) или предыдущего шага?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Укажите номер шага [$2-$3] для перезапуска операции обновления или нажмите [Enter] для отмены:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' не является числом. Укажите допустимый номер шага."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' - недопустимый номер шага. Укажите допустимый номер шага."
;;

MAX_STEP_NUMBER )
echo ""
echo "Последним является шаг $2, поэтому обновление нельзя перезапустить с шага $3."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "Еще не выполнен шаг $2, поэтому обновление нельзя перезапустить с шага $3."
;;


# ***********************
# * Сообщения для шагов *
# ***********************

STEP_0_IBMi )
echo "Шаг 0: Удалить таблицы"
echo "----------------------"
;;

STEP_0 )
echo "Шаг 0: Обновление файлов конфигурации"
echo "---------------------------"
;;

STEP_1_ADD )
echo "Шаг 1: Добавление таблиц"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Шаг $2: Реорганизация индексов"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "Шаг $2: Повторное создание индексов поиска и запроса"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Шаг $2: Слияние LPA с JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Шаг $2: Исправление внешнего URL областей хранения LPA"
echo "----------------------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Шаг $2: Удаление друга LPA из RM"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Шаг 2: Обновление схемы хранилища"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Шаг $2: Завершение приложения RM"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Шаг $2: Завершение приложения JTS"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Шаг $2: Переиндексация приложения RM"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "В ходе обновления $2 возник сбой на шаге $3.  Устраните ошибку и снова запустите сценарий, начиная с шага $3."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "Обновление $2 успешно выполнено.  Теперь можно обновить любые приложения, установленные в вашей среде."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "Не требующие подключения действия по обновлению RM успешно выполнены. Теперь можно запустить серверы."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "Не требующие подключения действия по обновлению RM успешно выполнены. Остался один"
echo "шаг, необходимый для завершения миграции, но для него требуется включить все"
echo "серверы, связанные с RM (например, RTC, RQM, JRS, GC). При удобном случае включите"
echo "все серверы (в том числе RM). Рекомендуется войти в систему каждого сервера"
echo "и проверить его работу. Затем введите следующую команду:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "Обновление $2 успешно выполнено.  Теперь можно запустить серверы."
echo ""
;;

# *******************************
# * Сообщения этапа выполнения  *
# *******************************

STEP_DIR_CMD )
echo ""
echo "Каталог: $2"
echo "Команда:"
;;

ENTER_STEP_ACTION )
echo "Введите [E] для выполнения этого шага, [S] для пропуска шага или нажмите [Enter] для отмены выполнения сценария:"
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' - недопустимое значение, введите 'E', 'S' или нажмите 'Enter'"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Будет открыт редактор vi, в котором можно проверить файл teamserver.properties $2."
echo "Проверьте правильность внешнего URI, указанного в свойстве com.ibm.team.repository.server.webapp.url."
echo "Проверьте правильность свойств базы данных."
echo "Сохраните внесенные изменения (если они будут) и закройте редактор для продолжения выполнения сценария."
echo ""
echo "См. инструкции по настройке каждого свойства в разделе"
echo "'Обновление решения Rational для CLM' документации продукта".
;;

PAUSE )
echo ""
echo "Введите [C] для продолжения или нажмите [Enter] для отмены сценария:"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "Вариант ответа '$2' недопустим. Введите 'C' или нажмите 'Enter'"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Копирование текстовых индексов из '$2' в '$3'."
echo "Это может занять несколько минут..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Копирование индексов поиска и запросов из '$2' в '$3'." 
echo "Это может занять несколько минут..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Ошибка копирования индексов из '$2' в '$3'."
echo "Проверьте свойство com.ibm.team.fulltext.indexLocation"
echo "в файле teamserver.properties."
echo "Скопируйте вручную индексы в этот каталог или"
echo "создайте их повторно командой repotools -rebuildTextIndices."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "Файл $NEW_APP_PARENT_DIR/RM_APP.ID не существует"
echo "Создайте этот файл с одной строкой, содержащей ИД приложения RM,"
echo "и повторите запрос."
echo ""
;;

# *****************************************
# * Сообщения для проверки внешних URI    *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ОШИБКА !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Внешний URI не определен в"
echo "$3,"
echo "поэтому невозможно выполнить обновление."
echo ""
echo "В этом файле должен быть определен один внешний URI следующего вида:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "В файле teamserver.properties должно быть задано свойство внешнего URI, com.ibm.team.repository.server.webapp.url."
echo "Добавьте это свойство в файл teamserver.properties предыдущей установки и укажите в нем корневой URI, применяемый всеми клиентами для обращения к серверу."
echo "Корневой внешний URI необходим для правильной работы вновь установленной программы. Обновление не будет выполнено при отсутствии этого свойства.  "
echo "Дополнительную информацию можно найти в разделе 'Планирование URI' документации продукта."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ОШИБКА !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Все внешние URI, определенные в"
echo "$3,"
echo "находятся в комментарии, поэтому невозможно выполнить обновление."
echo ""
echo "Этот файл должен содержать один внешний URI без комментариев в следующем формате:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "В файле teamserver.properties должно быть задано свойство внешнего URI, com.ibm.team.repository.server.webapp.url."
echo "Добавьте это свойство в файл teamserver.properties предыдущей установки и укажите в нем корневой URI, применяемый всеми клиентами для обращения к серверу."
echo "Корневой внешний URI необходим для правильной работы вновь установленной программы. Обновление не будет выполнено при отсутствии этого свойства."
echo "Дополнительную информацию можно найти в разделе 'Планирование URI' документации продукта."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "Корневой контекст JTS - '$2'."
echo "Корневой контекст приложения - '$3'."
echo "Корневые контексты jts и приложения не могут совпадать."
echo ""
;;

esac

}
